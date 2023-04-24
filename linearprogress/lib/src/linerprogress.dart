// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of linearprogress;

class LinearProgress extends StatefulWidget {
  LinearProgress(
      {Key? key,
      required this.background,
      required this.forground,
      this.gradient,
      required this.begin,
      required this.end,
      required this.gradients,
      required this.value})
      : super(key: key);
  double value = 0.0;
  final Color? background;
  final Color? forground;
  final bool? gradient;
  final Alignment begin;
  final Alignment end;
  final List<Color> gradients;

  @override
  State<LinearProgress> createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress> {
  final _duration = const Duration(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: _duration,
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.background,
                ),
              ),
              AnimatedContainer(
                duration: _duration,
                curve: Curves.linear,
                height: 15,
                width: constraints.maxWidth * widget.value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: widget.gradient == false
                      ? null
                      : LinearGradient(
                          colors: widget.gradients,
                          begin: widget.begin,
                          end: widget.end,
                        ),
                  color: widget.gradient == false ? null : widget.forground,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
