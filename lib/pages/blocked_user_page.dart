import 'package:flutter/material.dart';
import 'package:arther_chat_app/components/user_tile.dart';
import 'package:arther_chat_app/services/auth/auth_service.dart';
import 'package:arther_chat_app/services/chat/chat_service.dart';

class BlockedUsersPage extends StatelessWidget {
  BlockedUsersPage({super.key});

  // chat & auth service
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  //show confirm unblock box
  void _showUnblockBox(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Unblock User"),
        content: const Text("Are you sure you want to unblock this user?"),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          // report Button
          TextButton(
            onPressed: () {
              ChatService().unblockUser(userId);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("User unblocked"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: const Text("Unblock"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get current user id
    String userId = authService.getCurrentUser()!.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOCKED USERS"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: chatService.getBlockedUsersStream(userId),
        builder: (context, snapshot) {
          //errors
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error Loading"),
            );
          }

          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final blockedUsers = snapshot.data ?? [];

          //no users
          if (blockedUsers.isEmpty) {
            return const Center(
              child: Text("No blocked users"),
            );
          }

          //load complete
          return ListView.builder(
              itemCount: blockedUsers.length,
              itemBuilder: (context, index) {
                final user = blockedUsers[index];
                return UserTile(
                    text: user['email'],
                    onTap: () => _showUnblockBox(context, user['uid']));
              });
        },
      ),
    );
  }
}