.class public interface abstract Ln1/t;
.super Ljava/lang/Object;
.source "ShapeDelegate.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ln1/t$a;,
        Ln1/t$b;,
        Ln1/t$c;,
        Ln1/t$d;,
        Ln1/t$e;
    }
.end annotation


# static fields
.field public static final a:Ln1/t$c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ln1/t$c;->a:Ln1/t$c;

    .line 2
    .line 3
    sput-object v0, Ln1/t;->a:Ln1/t$c;

    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public abstract a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;FZ)Landroid/animation/ValueAnimator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ":",
            "Lcom/android/launcher3/views/u;",
            ">(TT;",
            "Landroid/graphics/Rect;",
            "Landroid/graphics/Rect;",
            "FZ)",
            "Landroid/animation/ValueAnimator;"
        }
    .end annotation
.end method

.method public b(F)Landroid/graphics/Path;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    int-to-float v1, v1

    .line 8
    div-float/2addr p1, v1

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {p0, v0, v1, v1, p1}, Ln1/t;->c(Landroid/graphics/Path;FFF)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public abstract c(Landroid/graphics/Path;FFF)V
.end method

.method public abstract d(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V
.end method

.method public e(Landroid/graphics/Rect;)Landroid/graphics/Path;
    .locals 4

    .line 1
    const-string v0, "bounds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Path;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 9
    .line 10
    .line 11
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    iget v2, p1, Landroid/graphics/Rect;->top:I

    .line 15
    .line 16
    int-to-float v2, v2

    .line 17
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    add-int/2addr v3, p1

    .line 26
    int-to-float p1, v3

    .line 27
    const/high16 v3, 0x40800000    # 4.0f

    .line 28
    .line 29
    div-float/2addr p1, v3

    .line 30
    invoke-interface {p0, v0, v1, v2, p1}, Ln1/t;->c(Landroid/graphics/Path;FFF)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method
