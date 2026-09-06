.class Landroidx/transition/y;
.super Ljava/lang/Object;
.source "ViewUtils.java"


# static fields
.field private static final a:Landroidx/transition/z;

.field static final b:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static final c:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/transition/D;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/transition/D;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/transition/y;->a:Landroidx/transition/z;

    .line 7
    .line 8
    new-instance v0, Landroidx/transition/y$a;

    .line 9
    .line 10
    const-class v1, Ljava/lang/Float;

    .line 11
    .line 12
    const-string v2, "translationAlpha"

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Landroidx/transition/y$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Landroidx/transition/y;->b:Landroid/util/Property;

    .line 18
    .line 19
    new-instance v0, Landroidx/transition/y$b;

    .line 20
    .line 21
    const-class v1, Landroid/graphics/Rect;

    .line 22
    .line 23
    const-string v2, "clipBounds"

    .line 24
    .line 25
    invoke-direct {v0, v1, v2}, Landroidx/transition/y$b;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Landroidx/transition/y;->c:Landroid/util/Property;

    .line 29
    .line 30
    return-void
.end method

.method static a(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object v0, Landroidx/transition/y;->a:Landroidx/transition/z;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroidx/transition/z;->a(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static b(Landroid/view/View;)F
    .locals 1

    .line 1
    sget-object v0, Landroidx/transition/y;->a:Landroidx/transition/z;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroidx/transition/z;->b(Landroid/view/View;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method static c(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object v0, Landroidx/transition/y;->a:Landroidx/transition/z;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroidx/transition/z;->c(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static d(Landroid/view/View;IIII)V
    .locals 6

    .line 1
    sget-object v0, Landroidx/transition/y;->a:Landroidx/transition/z;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-virtual/range {v0 .. v5}, Landroidx/transition/z;->d(Landroid/view/View;IIII)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method static e(Landroid/view/View;F)V
    .locals 1

    .line 1
    sget-object v0, Landroidx/transition/y;->a:Landroidx/transition/z;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Landroidx/transition/z;->e(Landroid/view/View;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static f(Landroid/view/View;I)V
    .locals 1

    .line 1
    sget-object v0, Landroidx/transition/y;->a:Landroidx/transition/z;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Landroidx/transition/z;->f(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static g(Landroid/view/View;Landroid/graphics/Matrix;)V
    .locals 1

    .line 1
    sget-object v0, Landroidx/transition/y;->a:Landroidx/transition/z;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Landroidx/transition/z;->g(Landroid/view/View;Landroid/graphics/Matrix;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static h(Landroid/view/View;Landroid/graphics/Matrix;)V
    .locals 1

    .line 1
    sget-object v0, Landroidx/transition/y;->a:Landroidx/transition/z;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Landroidx/transition/z;->h(Landroid/view/View;Landroid/graphics/Matrix;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
