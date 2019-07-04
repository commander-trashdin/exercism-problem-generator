# Make LRU-cache structure

In this exercise you should make an "LRU-cache". It is associative container,
that deletes elements by "Lest Recently Used" principle.
Basic interface is given.

While cach size is less then max, it works similarly to an oordinary hash-map:

 * Function `set` make new key-value pair.
 * Function `get` retruns `nil`, if no such key exists. If it does exist,`get`
 returns this value and `t`.
If after `set` cach size exceeds `max-size`, `LRU` alrogithm starts working and
cache removes the key that was least recently used (in `get` or `set` ).
`get` and `set` complexity should be `O(1)` in average.

<details>
  <summary></summary>
  You can use these two containers -- list and hash-table.
</details>

