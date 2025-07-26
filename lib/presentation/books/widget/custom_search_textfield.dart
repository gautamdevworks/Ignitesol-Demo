import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ignitesol_demo/const/image_const.dart';

class CustomSearchBox extends StatefulWidget {
  const CustomSearchBox({
    super.key,
    this.hint = "Search",
    required this.onChanged,
    this.controller,
  });

  final TextEditingController? controller;
  final String hint;
  final Function(String) onChanged;

  @override
  State<CustomSearchBox> createState() => _CustomSearchBoxState();
}

class _CustomSearchBoxState extends State<CustomSearchBox> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, 
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F9), // light gray background
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: _controller.text.isNotEmpty ? Colors.deepPurple : Colors.transparent,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: TextFormField(
          controller: _controller,  
          onChanged: (value) {
            setState(() {});
            widget.onChanged(value);
          },
          style: TextStyle(
            fontWeight: _controller.text.isNotEmpty ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12),
            isDense: true,
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(ImageConst.search),
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () {
                      _controller.clear();
                      widget.onChanged('');
                      setState(() {});
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
