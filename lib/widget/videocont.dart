import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

class Videocont extends StatefulWidget {
  final dynamic model;
  const Videocont({super.key, required this.model});

  @override
  State<Videocont> createState() => _VideocontState();
}

class _VideocontState extends State<Videocont> {
  @override
  Widget build(BuildContext context) {
    final String? imageUrl = widget.model?.videoUrl;
    final bool imagebor = imageUrl != null && imageUrl.isNotEmpty;
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.35,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: imagebor
                ? null
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Cols.divider,
                      Cols.divider,
                      Cols.divider,
                      Cols.dark,
                    ],
                  ),
            image: imagebor
                ? DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: !imagebor
              ? const Center(
                  child: Icon(Icons.photo, size: 60, color: Colors.grey),
                )
              : null,
        ),
        Positioned(
          top: 5,
          left: 20,
          right: 20,
          child: SafeArea(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    backgroundColor: Cols.orange,
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                const Spacer(),
                // Ulashish tugmasi
                GestureDetector(
                  onTap: () {
                    // Ulashish kodi
                  },
                  child: CircleAvatar(
                    backgroundColor: Cols.orange,
                    child: Icon(Icons.share),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    widget.model.yurak = !widget.model.yurak;
                    setState(() {});
                  },
                  child: CircleAvatar(
                    backgroundColor: Cols.orange,
                    child: Icon(
                      widget.model.yurak == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.model.yurak == true
                          ? Cols.danger
                          : Cols.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 20,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Cols.orange,
                ),
                child: Text(
                  widget.model.turi,
                  style: TextStyle(color: Cols.white),
                ),
              ),
              Text(
                widget.model.nomi,
                style: TextStyle(
                  color: Cols.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
