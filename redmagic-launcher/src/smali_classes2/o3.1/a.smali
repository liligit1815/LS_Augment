.class public Lo3/a;
.super Landroid/graphics/drawable/Drawable;
.source "RippleDrawableCompat.java"

# interfaces
.implements Lq3/n;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo3/a$b;
    }
.end annotation


# instance fields
.field private g:Lo3/a$b;


# direct methods
.method private constructor <init>(Lo3/a$b;)V
    .locals 0

    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 4
    iput-object p1, p0, Lo3/a;->g:Lo3/a$b;

    return-void
.end method

.method synthetic constructor <init>(Lo3/a$b;Lo3/a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lo3/a;-><init>(Lo3/a$b;)V

    return-void
.end method

.method public constructor <init>(Lq3/k;)V
    .locals 2

    .line 2
    new-instance v0, Lo3/a$b;

    new-instance v1, Lq3/g;

    invoke-direct {v1, p1}, Lq3/g;-><init>(Lq3/k;)V

    invoke-direct {v0, v1}, Lo3/a$b;-><init>(Lq3/g;)V

    invoke-direct {p0, v0}, Lo3/a;-><init>(Lo3/a$b;)V

    return-void
.end method


# virtual methods
.method public a()Lo3/a;
    .locals 2

    .line 1
    new-instance v0, Lo3/a$b;

    .line 2
    .line 3
    iget-object v1, p0, Lo3/a;->g:Lo3/a$b;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lo3/a$b;-><init>(Lo3/a$b;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lo3/a;->g:Lo3/a$b;

    .line 9
    .line 10
    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 2
    .line 3
    iget-boolean v0, p0, Lo3/a$b;->b:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lo3/a$b;->a:Lq3/g;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lq3/g;->draw(Landroid/graphics/Canvas;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0

    .line 1
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 2
    .line 3
    iget-object p0, p0, Lo3/a$b;->a:Lq3/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lq3/g;->getOpacity()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isStateful()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public bridge synthetic mutate()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lo3/a;->a()Lo3/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 5
    .line 6
    iget-object p0, p0, Lo3/a$b;->a:Lq3/g;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected onStateChange([I)Z
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onStateChange([I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lo3/a;->g:Lo3/a$b;

    .line 6
    .line 7
    iget-object v1, v1, Lo3/a$b;->a:Lq3/g;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    move v0, v2

    .line 17
    :cond_0
    invoke-static {p1}, Lo3/b;->e([I)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 22
    .line 23
    iget-boolean v1, p0, Lo3/a$b;->b:Z

    .line 24
    .line 25
    if-eq v1, p1, :cond_1

    .line 26
    .line 27
    iput-boolean p1, p0, Lo3/a$b;->b:Z

    .line 28
    .line 29
    return v2

    .line 30
    :cond_1
    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 2
    .line 3
    iget-object p0, p0, Lo3/a$b;->a:Lq3/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lq3/g;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 2
    .line 3
    iget-object p0, p0, Lo3/a$b;->a:Lq3/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lq3/g;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setShapeAppearanceModel(Lq3/k;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 2
    .line 3
    iget-object p0, p0, Lo3/a$b;->a:Lq3/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lq3/g;->setShapeAppearanceModel(Lq3/k;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setTint(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 2
    .line 3
    iget-object p0, p0, Lo3/a$b;->a:Lq3/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lq3/g;->setTint(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 2
    .line 3
    iget-object p0, p0, Lo3/a$b;->a:Lq3/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lq3/g;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lo3/a;->g:Lo3/a$b;

    .line 2
    .line 3
    iget-object p0, p0, Lo3/a$b;->a:Lq3/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lq3/g;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
