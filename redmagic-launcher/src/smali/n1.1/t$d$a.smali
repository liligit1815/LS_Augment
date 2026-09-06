.class final synthetic Ln1/t$d$a;
.super Lkotlin/jvm/internal/a;
.source "ShapeDelegate.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ln1/t$d;->a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;FZ)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/a;",
        "Lu4/p<",
        "Ljava/lang/Float;",
        "Landroid/graphics/Path;",
        "Lh4/t;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 7

    .line 1
    const-string v5, "toPath(Landroidx/graphics/shapes/Morph;FLandroid/graphics/Path;)Landroid/graphics/Path;"

    .line 2
    .line 3
    const/16 v6, 0x9

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    const-class v3, LU/A;

    .line 7
    .line 8
    const-string v4, "toPath"

    .line 9
    .line 10
    move-object v0, p0

    .line 11
    move-object v2, p1

    .line 12
    invoke-direct/range {v0 .. v6}, Lkotlin/jvm/internal/a;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(FLandroid/graphics/Path;)V
    .locals 1

    .line 1
    const-string v0, "p1"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lkotlin/jvm/internal/a;->receiver:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, LU/o;

    .line 9
    .line 10
    invoke-static {p0, p1, p2}, LU/A;->b(LU/o;FLandroid/graphics/Path;)Landroid/graphics/Path;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Number;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    check-cast p2, Landroid/graphics/Path;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ln1/t$d$a;->a(FLandroid/graphics/Path;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 13
    .line 14
    return-object p0
.end method
