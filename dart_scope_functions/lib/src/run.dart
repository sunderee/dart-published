typedef RunCallback<R> = R Function();

/// Calls the specified function [block] and returns its result.
R run<R>(RunCallback<R> block) => block.call();
