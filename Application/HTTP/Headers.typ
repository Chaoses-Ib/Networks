#import "@local/ib:0.1.0": *
#title[HTTP Headers]
#a-badge(body: [RFC 7230])[https://www.rfc-editor.org/rfc/rfc7230#section-3.2]
#a-badge(body: [RFC 9110])[https://www.rfc-editor.org/rfc/rfc9110.html#name-fields]
#a-badge[https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers]

= Field order
The order does not matter for headers with different names.
It does matter, however, for multiple headers with the same name.

#quote(block: true)[
The order in which header fields with differing field names are received is not significant.

(However, it is "good practice" to send general-header fields first, followed by request-header or response- header fields, and ending with the entity-header fields.)

However, it is good practice to send
header fields that contain control data first, such as `Host` on
requests and `Date` on responses, so that implementations can decide
when not to handle a message as early as possible.
]

#quote(block: true)[
Multiple message-header fields with the same field-name MAY be present in a message if and only if the entire field-value for that header field is defined as a comma-separated list [i.e., `#(values)`].
It MUST be possible to combine the multiple header fields into one `field-name: field-value` pair, without changing the semantics of the message, by appending each subsequent field-value to the first, each separated by a comma.
The order in which header fields with the same field-name are received is therefore significant to the interpretation of the combined field value, and thus a proxy MUST NOT change the order of these field values when a message is forwarded.
]

= Field values
#quote(block: true)[
The NUL octet is no longer allowed in comment and quoted-string text,
and handling of backslash-escaping in them has been clarified.  The
quoted-pair rule no longer allows escaping control characters other
than HTAB.  Non-US-ASCII content in header fields and the reason
phrase has been obsoleted and made opaque (the TEXT rule was
removed).
]

#quote(block: true)[
Field values are usually constrained to the range of US-ASCII characters [USASCII].
Fields needing a greater range of characters can use an encoding, such as the one defined in [RFC8187].

Historically, HTTP allowed field content with text in the ISO-8859-1 charset [ISO-8859-1], supporting other charsets only through use of [RFC2047] encoding.
Specifications for newly defined fields *SHOULD* limit their values to visible US-ASCII octets (VCHAR), SP, and HTAB.
A recipient *SHOULD* treat other allowed octets in field content (i.e., obs-text) as opaque data.
]
