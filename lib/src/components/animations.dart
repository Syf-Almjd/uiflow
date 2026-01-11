import 'package:flutter/material.dart';

/// Pre-built animation utilities for common use cases
class AppAnimations {
  /// Slide transition from bottom
  static Widget slideFromBottom({
    required Widget child,
    required Animation<double> animation,
    Curve curve = Curves.easeInOut,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve)),
      child: child,
    );
  }

  /// Slide transition from top
  static Widget slideFromTop({
    required Widget child,
    required Animation<double> animation,
    Curve curve = Curves.easeInOut,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve)),
      child: child,
    );
  }

  /// Slide transition from left
  static Widget slideFromLeft({
    required Widget child,
    required Animation<double> animation,
    Curve curve = Curves.easeInOut,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve)),
      child: child,
    );
  }

  /// Slide transition from right
  static Widget slideFromRight({
    required Widget child,
    required Animation<double> animation,
    Curve curve = Curves.easeInOut,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: curve)),
      child: child,
    );
  }

  /// Fade transition
  static Widget fade({
    required Widget child,
    required Animation<double> animation,
    Curve curve = Curves.easeInOut,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: curve),
      child: child,
    );
  }

  /// Scale transition
  static Widget scale({
    required Widget child,
    required Animation<double> animation,
    Curve curve = Curves.easeInOut,
    Alignment alignment = Alignment.center,
  }) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: curve),
      alignment: alignment,
      child: child,
    );
  }

  /// Rotation transition
  static Widget rotate({
    required Widget child,
    required Animation<double> animation,
    Curve curve = Curves.easeInOut,
  }) {
    return RotationTransition(
      turns: CurvedAnimation(parent: animation, curve: curve),
      child: child,
    );
  }

  /// Fade + Scale transition
  static Widget fadeAndScale({
    required Widget child,
    required Animation<double> animation,
    Curve curve = Curves.easeInOut,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: curve),
      child: ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: curve),
        child: child,
      ),
    );
  }

  /// Fade + Slide transition
  static Widget fadeAndSlide({
    required Widget child,
    required Animation<double> animation,
    Offset begin = const Offset(0, 0.3),
    Curve curve = Curves.easeInOut,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: curve),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: begin,
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: curve)),
        child: child,
      ),
    );
  }
}

/// Animated widget wrappers for simpler usage
class AnimatedFadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const AnimatedFadeIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.delay = Duration.zero,
    this.curve = Curves.easeIn,
  }) : super(key: key);

  @override
  State<AnimatedFadeIn> createState() => _AnimatedFadeInState();
}

class _AnimatedFadeInState extends State<AnimatedFadeIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

class AnimatedSlideIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final Offset begin;

  const AnimatedSlideIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
    this.begin = const Offset(0, 0.3),
  }) : super(key: key);

  @override
  State<AnimatedSlideIn> createState() => _AnimatedSlideInState();
}

class _AnimatedSlideInState extends State<AnimatedSlideIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: widget.begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}

class AnimatedScaleIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const AnimatedScaleIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.delay = Duration.zero,
    this.curve = Curves.elasticOut,
  }) : super(key: key);

  @override
  State<AnimatedScaleIn> createState() => _AnimatedScaleInState();
}

class _AnimatedScaleInState extends State<AnimatedScaleIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}

/// Staggered list animation
class StaggeredListAnimation extends StatelessWidget {
  final int itemCount;
  final Duration staggerDuration;
  final Duration itemDuration;
  final Widget Function(BuildContext, int) itemBuilder;

  const StaggeredListAnimation({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.staggerDuration = const Duration(milliseconds: 100),
    this.itemDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return AnimatedFadeIn(
          delay: staggerDuration * index,
          duration: itemDuration,
          child: itemBuilder(context, index),
        );
      },
    );
  }
}

/// Shimmer effect for loading states
class ShimmerLoading extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerLoading({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.baseColor,
    this.highlightColor,
  }) : super(key: key);

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.baseColor ?? Colors.grey[300]!,
                widget.highlightColor ?? Colors.grey[100]!,
                widget.baseColor ?? Colors.grey[300]!,
              ],
              stops: [
                _controller.value - 0.3,
                _controller.value,
                _controller.value + 0.3,
              ].map((e) => e.clamp(0.0, 1.0)).toList(),
            ).createShader(bounds);
          },
          child: child,
        );
      },
    );
  }
}
