.class public Lr1/a;
.super Ls1/o;
.source "AddIconFolderDrawable.java"


# instance fields
.field private A:Lcom/android/launcher3/model/data/I;

.field private B:Landroid/graphics/Bitmap;

.field private C:Landroid/animation/ValueAnimator;

.field D:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lr1/a;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private y:Landroid/graphics/drawable/Drawable;

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ls1/o;-><init>(Ls1/d;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lr1/a$a;

    .line 7
    .line 8
    const-class v1, Ljava/lang/Integer;

    .line 9
    .line 10
    const-string v2, "alpha"

    .line 11
    .line 12
    invoke-direct {v0, p0, v1, v2}, Lr1/a$a;-><init>(Lr1/a;Ljava/lang/Class;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lr1/a;->D:Landroid/util/Property;

    .line 16
    .line 17
    iput-object p2, p0, Lr1/a;->A:Lcom/android/launcher3/model/data/I;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p2, v0}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 24
    .line 25
    iget-object v1, v1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 26
    .line 27
    invoke-static {p1, v1}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lr1/a;->y:Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    iput v0, p0, Lr1/a;->z:I

    .line 34
    .line 35
    iget-object p1, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 36
    .line 37
    iget-object p1, p1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 38
    .line 39
    iput-object p1, p0, Lr1/a;->B:Landroid/graphics/Bitmap;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method protected c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lr1/a;->y:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lr1/a;->y:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    iget v0, p0, Lr1/a;->z:I

    .line 9
    .line 10
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lr1/a;->y:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lr1/a;->y:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lr1/a;->y:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Ls1/o;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public v()I
    .locals 0

    .line 1
    iget p0, p0, Lr1/a;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public w(I)V
    .locals 0

    .line 1
    iput p1, p0, Lr1/a;->z:I

    .line 2
    .line 3
    return-void
.end method

.method public x()V
    .locals 3

    .line 1
    iget-object v0, p0, Lr1/a;->C:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lr1/a;->D:Landroid/util/Property;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/16 v2, 0xff

    .line 12
    .line 13
    filled-new-array {v1, v2}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lr1/a;->C:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    new-instance v1, Lr1/a$b;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Lr1/a$b;-><init>(Lr1/a;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lr1/a;->C:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    const-wide/16 v1, 0x190

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lr1/a;->C:Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 49
    .line 50
    .line 51
    return-void
.end method
