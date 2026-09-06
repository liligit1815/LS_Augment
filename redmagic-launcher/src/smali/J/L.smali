.class public final LJ/L;
.super Ljava/lang/Object;
.source "ViewConfigurationCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LJ/L$a;,
        LJ/L$b;,
        LJ/L$c;
    }
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private static a(Landroid/content/res/Resources;ILI/j;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "I",
            "LI/j<",
            "Ljava/lang/Integer;",
            ">;I)I"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_2

    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-gez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return p0

    .line 14
    :cond_1
    :goto_0
    return p3

    .line 15
    :cond_2
    invoke-interface {p2}, LI/j;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method private static b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 1
    const-string v0, "android"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private static c(Landroid/content/res/Resources;II)I
    .locals 1

    .line 1
    const/high16 v0, 0x400000

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/16 p1, 0x1a

    .line 6
    .line 7
    if-ne p2, p1, :cond_0

    .line 8
    .line 9
    const-string p1, "config_viewMaxRotaryEncoderFlingVelocity"

    .line 10
    .line 11
    const-string p2, "dimen"

    .line 12
    .line 13
    invoke-static {p0, p1, p2}, LJ/L;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, -0x1

    .line 19
    return p0
.end method

.method private static d(Landroid/content/res/Resources;II)I
    .locals 1

    .line 1
    const/high16 v0, 0x400000

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/16 p1, 0x1a

    .line 6
    .line 7
    if-ne p2, p1, :cond_0

    .line 8
    .line 9
    const-string p1, "config_viewMinRotaryEncoderFlingVelocity"

    .line 10
    .line 11
    const-string p2, "dimen"

    .line 12
    .line 13
    invoke-static {p0, p1, p2}, LJ/L;->b(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, -0x1

    .line 19
    return p0
.end method

.method public static e(Landroid/view/ViewConfiguration;Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-static {p0}, LJ/L$a;->a(Landroid/view/ViewConfiguration;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static f(Landroid/content/Context;Landroid/view/ViewConfiguration;III)I
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2, p3, p4}, LJ/L$c;->a(Landroid/view/ViewConfiguration;III)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {p2, p3, p4}, LJ/L;->i(III)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    const/high16 v0, -0x80000000

    .line 17
    .line 18
    if-nez p2, :cond_1

    .line 19
    .line 20
    return v0

    .line 21
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0, p4, p3}, LJ/L;->c(Landroid/content/res/Resources;II)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    new-instance p3, LJ/J;

    .line 33
    .line 34
    invoke-direct {p3, p1}, LJ/J;-><init>(Landroid/view/ViewConfiguration;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p0, p2, p3, v0}, LJ/L;->a(Landroid/content/res/Resources;ILI/j;I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public static g(Landroid/content/Context;Landroid/view/ViewConfiguration;III)I
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2, p3, p4}, LJ/L$c;->b(Landroid/view/ViewConfiguration;III)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {p2, p3, p4}, LJ/L;->i(III)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    const v0, 0x7fffffff

    .line 17
    .line 18
    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0, p4, p3}, LJ/L;->d(Landroid/content/res/Resources;II)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    new-instance p3, LJ/K;

    .line 34
    .line 35
    invoke-direct {p3, p1}, LJ/K;-><init>(Landroid/view/ViewConfiguration;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p0, p2, p3, v0}, LJ/L;->a(Landroid/content/res/Resources;ILI/j;I)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0
.end method

.method public static h(Landroid/view/ViewConfiguration;Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-static {p0}, LJ/L$a;->b(Landroid/view/ViewConfiguration;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static i(III)Z
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Landroid/view/InputDevice;->getMotionRange(II)Landroid/view/InputDevice$MotionRange;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static j(Landroid/view/ViewConfiguration;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {p0}, LJ/L$b;->a(Landroid/view/ViewConfiguration;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
