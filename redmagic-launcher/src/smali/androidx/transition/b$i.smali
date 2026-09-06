.class Landroidx/transition/b$i;
.super Ljava/lang/Object;
.source "ChangeBounds.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/transition/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "i"
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private final e:Landroid/view/View;

.field private f:I

.field private g:I


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/transition/b$i;->e:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method

.method private b()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/transition/b$i;->e:Landroid/view/View;

    .line 2
    .line 3
    iget v1, p0, Landroidx/transition/b$i;->a:I

    .line 4
    .line 5
    iget v2, p0, Landroidx/transition/b$i;->b:I

    .line 6
    .line 7
    iget v3, p0, Landroidx/transition/b$i;->c:I

    .line 8
    .line 9
    iget v4, p0, Landroidx/transition/b$i;->d:I

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, v4}, Landroidx/transition/y;->d(Landroid/view/View;IIII)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Landroidx/transition/b$i;->f:I

    .line 16
    .line 17
    iput v0, p0, Landroidx/transition/b$i;->g:I

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method a(Landroid/graphics/PointF;)V
    .locals 1

    .line 1
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Landroidx/transition/b$i;->c:I

    .line 8
    .line 9
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Landroidx/transition/b$i;->d:I

    .line 16
    .line 17
    iget p1, p0, Landroidx/transition/b$i;->g:I

    .line 18
    .line 19
    add-int/lit8 p1, p1, 0x1

    .line 20
    .line 21
    iput p1, p0, Landroidx/transition/b$i;->g:I

    .line 22
    .line 23
    iget v0, p0, Landroidx/transition/b$i;->f:I

    .line 24
    .line 25
    if-ne v0, p1, :cond_0

    .line 26
    .line 27
    invoke-direct {p0}, Landroidx/transition/b$i;->b()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method c(Landroid/graphics/PointF;)V
    .locals 1

    .line 1
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Landroidx/transition/b$i;->a:I

    .line 8
    .line 9
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Landroidx/transition/b$i;->b:I

    .line 16
    .line 17
    iget p1, p0, Landroidx/transition/b$i;->f:I

    .line 18
    .line 19
    add-int/lit8 p1, p1, 0x1

    .line 20
    .line 21
    iput p1, p0, Landroidx/transition/b$i;->f:I

    .line 22
    .line 23
    iget v0, p0, Landroidx/transition/b$i;->g:I

    .line 24
    .line 25
    if-ne p1, v0, :cond_0

    .line 26
    .line 27
    invoke-direct {p0}, Landroidx/transition/b$i;->b()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
