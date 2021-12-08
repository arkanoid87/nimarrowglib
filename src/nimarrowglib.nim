import futhark

importc:
    absPath "/usr/lib/clang/10/include"
    path "/usr/include/arrow-glib"
    path "/usr/include/glib-2.0"
    path "/usr/lib/x86_64-linux-gnu/glib-2.0/include"
    define UTF8PROC_EXPORTS
    # "arrow-glib.h" # doesn't define any symbol nothing by itself
    "arrow-glib/gobject-type.h"
    "arrow-glib/version.h"
    "arrow-glib/array.h"
    "arrow-glib/array-builder.h"
    "arrow-glib/chunked-array.h"
    "arrow-glib/codec.h"
    "arrow-glib/compute.h"
    "arrow-glib/data-type.h"
    "arrow-glib/datum.h"
    "arrow-glib/enums.h"
    "arrow-glib/error.h"
    "arrow-glib/expression.h"
    "arrow-glib/field.h"
    "arrow-glib/record-batch.h"
    "arrow-glib/scalar.h"
    "arrow-glib/schema.h"
    "arrow-glib/table.h"
    "arrow-glib/table-builder.h"
    "arrow-glib/tensor.h"
    "arrow-glib/type.h"
    "arrow-glib/file.h"
    "arrow-glib/file-mode.h"
    "arrow-glib/input-stream.h"
    "arrow-glib/output-stream.h"
    "arrow-glib/readable.h"
    "arrow-glib/writable.h"
    "arrow-glib/writable-file.h"
    "arrow-glib/ipc-options.h"
    "arrow-glib/metadata-version.h"
    "arrow-glib/reader.h"
    "arrow-glib/writer.h"
    "arrow-glib/file-system.h"
    "arrow-glib/local-file-system.h"
    # manually added as not included in arrow-glib.h
    "arrow-glib/basic-array.h"
    "gobject/gobject.h"


var error: ptr Gerror

var builder = garrow_int32_array_builder_new()

discard garrow_int32_array_builder_append_value(builder, 29, error.addr)
discard garrow_int32_array_builder_append_value(builder, 2929, error.addr)
discard garrow_int32_array_builder_append_value(builder, 292929, error.addr)

var myarray = garrow_array_builder_finish(cast[ptr Garrowarraybuilder](builder), error.addr)
g_object_unref(builder)

var n = garrow_array_get_length(myarray)
echo n

for i in 0..<n:
    var val = garrow_int32_array_get_value(cast[ptr Garrowint32array](myarray), i)
    echo val

g_object_unref(myarray)
