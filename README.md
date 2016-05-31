# Guards

This is guards notation defined in user space.

## Usage

If statements in Elm can get... verbose.

```elm
foo : Int -> String
foo x =
  if x < 10 then
    "x was small"
  else if x > 100 then
    "x was big"
  else if x == 25 then
    "x was 25 exactly"
  else
    "we hit default case"
```

Guards help with all that

```elm
foo : Int -> String
foo x = x < 10  => "x was small"
     |= x > 100 => "x was big"
     |= x == 25 => "x was 25 exactly"
     |= "we hit default case"
```

## User space?

Guards a usually compiler feature, its even one Elm had, but it was removed.
There are 3 advantages to doing this in user space.

  - Functions are total, (there is no way to avoid providing a default)
  - Same tight notation as when supported by the compiler  
  - Fewer language features (user space is its own reward)

## You can nest and get crazy. Don't.

Guards make code more readable for simple flat expressions with lot of branches, not for times like this:

```elm
foo m a = case m of
  Just x -> x >= 0 => "positive!"
         |= x <  0 => (a == 100 => "wowzers!"
                      |= a > 100 => "trousers!"
                      |= "a wasn't cool")
         |= case a of
           0 -> "a was 0"
           _ -> "who knows"
  Nothing -> "murf"
```

The above code will compile, but you should be sad if your code looks like that.
