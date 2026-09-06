.class public final LA/k;
.super Ljava/lang/Object;
.source "TypedArray.kt"


# direct methods
.method private static final a(Landroid/content/res/TypedArray;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 9
    .line 10
    const-string p1, "Attribute not defined in set."

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method

.method public static final b(Landroid/content/res/TypedArray;I)F
    .locals 1

    .line 1
    invoke-static {p0, p1}, LA/k;->a(Landroid/content/res/TypedArray;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
