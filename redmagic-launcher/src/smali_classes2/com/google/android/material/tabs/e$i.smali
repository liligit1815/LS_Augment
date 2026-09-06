.class public final Lcom/google/android/material/tabs/e$i;
.super Landroid/widget/LinearLayout;
.source "TabLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/tabs/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "i"
.end annotation


# instance fields
.field private g:Lcom/google/android/material/tabs/e$g;

.field private h:Landroid/widget/TextView;

.field private i:Landroid/widget/ImageView;

.field private j:Landroid/view/View;

.field private k:LZ2/a;

.field private l:Landroid/view/View;

.field private m:Landroid/widget/TextView;

.field private n:Landroid/widget/ImageView;

.field private o:Landroid/graphics/drawable/Drawable;

.field private p:I

.field final synthetic q:Lcom/google/android/material/tabs/e;


# direct methods
.method public constructor <init>(Lcom/google/android/material/tabs/e;Landroid/content/Context;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    iput v0, p0, Lcom/google/android/material/tabs/e$i;->p:I

    .line 8
    .line 9
    invoke-direct {p0, p2}, Lcom/google/android/material/tabs/e$i;->t(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iget p2, p1, Lcom/google/android/material/tabs/e;->k:I

    .line 13
    .line 14
    iget v0, p1, Lcom/google/android/material/tabs/e;->l:I

    .line 15
    .line 16
    iget v1, p1, Lcom/google/android/material/tabs/e;->m:I

    .line 17
    .line 18
    iget v2, p1, Lcom/google/android/material/tabs/e;->n:I

    .line 19
    .line 20
    invoke-static {p0, p2, v0, v1, v2}, LJ/I;->z0(Landroid/view/View;IIII)V

    .line 21
    .line 22
    .line 23
    const/16 p2, 0x11

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 26
    .line 27
    .line 28
    iget-boolean p1, p1, Lcom/google/android/material/tabs/e;->K:Z

    .line 29
    .line 30
    const/4 p2, 0x1

    .line 31
    xor-int/2addr p1, p2

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const/16 p2, 0x3ea

    .line 43
    .line 44
    invoke-static {p1, p2}, LJ/A;->b(Landroid/content/Context;I)LJ/A;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p0, p1}, LJ/I;->A0(Landroid/view/View;LJ/A;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method static synthetic a(Lcom/google/android/material/tabs/e$i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/tabs/e$i;->r(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic b(Lcom/google/android/material/tabs/e$i;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/tabs/e$i;->t(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic c(Lcom/google/android/material/tabs/e$i;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/material/tabs/e$i;->drawBackground(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic d(Lcom/google/android/material/tabs/e$i;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private drawBackground(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->o:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getRight()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->o:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method static synthetic e(Lcom/google/android/material/tabs/e$i;)LZ2/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 2
    .line 3
    return-object p0
.end method

.method private f(Landroid/view/View;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Lcom/google/android/material/tabs/e$i$a;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/google/android/material/tabs/e$i$a;-><init>(Lcom/google/android/material/tabs/e$i;Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private g(Landroid/text/Layout;IF)F
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/text/Layout;->getLineWidth(I)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/text/TextPaint;->getTextSize()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    div-float/2addr p3, p1

    .line 14
    mul-float/2addr p0, p3

    .line 15
    return p0
.end method

.method private getBadge()LZ2/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 2
    .line 3
    return-object p0
.end method

.method private getOrCreateBadge()LZ2/a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, LZ2/a;->d(Landroid/content/Context;)LZ2/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 14
    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->q()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 24
    .line 25
    const-string v0, "Unable to create badge"

    .line 26
    .line 27
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method private h(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClipToPadding(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private i()Landroid/widget/FrameLayout;
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v1, -0x2

    .line 13
    invoke-direct {p0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private j(Landroid/view/View;)Landroid/widget/FrameLayout;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 7
    .line 8
    if-eq p1, p0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    sget-boolean p0, LZ2/c;->a:Z

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/widget/FrameLayout;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    return-object v1
.end method

.method private k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private l()V
    .locals 4

    .line 1
    sget-boolean v0, LZ2/c;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->i()Landroid/widget/FrameLayout;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object v0, p0

    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    sget v3, LX2/h;->b:I

    .line 24
    .line 25
    invoke-virtual {v2, v3, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/widget/ImageView;

    .line 30
    .line 31
    iput-object v2, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private m()V
    .locals 4

    .line 1
    sget-boolean v0, LZ2/c;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->i()Landroid/widget/FrameLayout;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object v0, p0

    .line 14
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget v2, LX2/h;->c:I

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Landroid/widget/TextView;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private o(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, v0}, Lcom/google/android/material/tabs/e$i;->h(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/google/android/material/tabs/e$i;->j(Landroid/view/View;)Landroid/widget/FrameLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, p1, v1}, LZ2/c;->a(LZ2/a;Landroid/view/View;Landroid/widget/FrameLayout;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/google/android/material/tabs/e$i;->j:Landroid/view/View;

    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method private p()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    invoke-direct {p0, v0}, Lcom/google/android/material/tabs/e$i;->h(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->j:Landroid/view/View;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 17
    .line 18
    invoke-static {v1, v0}, LZ2/c;->b(LZ2/a;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/google/android/material/tabs/e$i;->j:Landroid/view/View;

    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method private q()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->p()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 17
    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 21
    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e$g;->f()Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->j:Landroid/view/View;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 33
    .line 34
    if-eq v0, v1, :cond_2

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->p()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 40
    .line 41
    invoke-direct {p0, v0}, Lcom/google/android/material/tabs/e$i;->o(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-direct {p0, v1}, Lcom/google/android/material/tabs/e$i;->r(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 50
    .line 51
    if-eqz v0, :cond_5

    .line 52
    .line 53
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 54
    .line 55
    if-eqz v0, :cond_5

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e$g;->h()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, 0x1

    .line 62
    if-ne v0, v1, :cond_5

    .line 63
    .line 64
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->j:Landroid/view/View;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 67
    .line 68
    if-eq v0, v1, :cond_4

    .line 69
    .line 70
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->p()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 74
    .line 75
    invoke-direct {p0, v0}, Lcom/google/android/material/tabs/e$i;->o(Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    invoke-direct {p0, v1}, Lcom/google/android/material/tabs/e$i;->r(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_5
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->p()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method private r(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->j:Landroid/view/View;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/google/android/material/tabs/e$i;->j(Landroid/view/View;)Landroid/widget/FrameLayout;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, p1, p0}, LZ2/c;->c(LZ2/a;Landroid/view/View;Landroid/widget/FrameLayout;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private t(Landroid/content/Context;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    iget v0, v0, Lcom/google/android/material/tabs/e;->A:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1, v0}, Lg/a;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/google/android/material/tabs/e$i;->o:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/google/android/material/tabs/e$i;->o:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iput-object v1, p0, Lcom/google/android/material/tabs/e$i;->o:Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    :cond_1
    :goto_0
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 35
    .line 36
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/google/android/material/tabs/e;->t:Landroid/content/res/ColorStateList;

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 50
    .line 51
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 52
    .line 53
    .line 54
    const v2, 0x3727c5ac    # 1.0E-5f

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 58
    .line 59
    .line 60
    const/4 v2, -0x1

    .line 61
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/google/android/material/tabs/e;->t:Landroid/content/res/ColorStateList;

    .line 67
    .line 68
    invoke-static {v2}, Lo3/b;->a(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    .line 73
    .line 74
    iget-object v4, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 75
    .line 76
    iget-boolean v4, v4, Lcom/google/android/material/tabs/e;->O:Z

    .line 77
    .line 78
    if-eqz v4, :cond_2

    .line 79
    .line 80
    move-object p1, v1

    .line 81
    :cond_2
    if-eqz v4, :cond_3

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    move-object v1, v0

    .line 85
    :goto_1
    invoke-direct {v3, v2, p1, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 86
    .line 87
    .line 88
    move-object p1, v3

    .line 89
    :cond_4
    invoke-static {p0, p1}, LJ/I;->n0(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method private w(Landroid/widget/TextView;Landroid/widget/ImageView;Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e$g;->f()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e$g;->f()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, LC/a;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v0, v1

    .line 28
    :goto_0
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/google/android/material/tabs/e;->s:Landroid/content/res/ColorStateList;

    .line 33
    .line 34
    invoke-static {v0, v2}, LC/a;->o(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/google/android/material/tabs/e;->w:Landroid/graphics/PorterDuff$Mode;

    .line 40
    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    invoke-static {v0, v2}, LC/a;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 47
    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/google/android/material/tabs/e$g;->i()Ljava/lang/CharSequence;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    move-object v2, v1

    .line 56
    :goto_1
    const/16 v3, 0x8

    .line 57
    .line 58
    const/4 v4, 0x0

    .line 59
    if-eqz p2, :cond_4

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_3
    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 77
    .line 78
    .line 79
    :cond_4
    :goto_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz p1, :cond_8

    .line 84
    .line 85
    if-nez v0, :cond_5

    .line 86
    .line 87
    iget-object v5, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 88
    .line 89
    invoke-static {v5}, Lcom/google/android/material/tabs/e$g;->b(Lcom/google/android/material/tabs/e$g;)I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    const/4 v6, 0x1

    .line 94
    if-ne v5, v6, :cond_5

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_5
    move v6, v4

    .line 98
    :goto_3
    if-nez v0, :cond_6

    .line 99
    .line 100
    move-object v5, v2

    .line 101
    goto :goto_4

    .line 102
    :cond_6
    move-object v5, v1

    .line 103
    :goto_4
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    if-eqz v6, :cond_7

    .line 107
    .line 108
    move v5, v4

    .line 109
    goto :goto_5

    .line 110
    :cond_7
    move v5, v3

    .line 111
    :goto_5
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    if-nez v0, :cond_9

    .line 115
    .line 116
    invoke-virtual {p0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 117
    .line 118
    .line 119
    goto :goto_6

    .line 120
    :cond_8
    move v6, v4

    .line 121
    :cond_9
    :goto_6
    if-eqz p3, :cond_c

    .line 122
    .line 123
    if-eqz p2, :cond_c

    .line 124
    .line 125
    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 130
    .line 131
    if-eqz v6, :cond_a

    .line 132
    .line 133
    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    if-nez p3, :cond_a

    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object p3

    .line 143
    invoke-static {p3, v3}, Lcom/google/android/material/internal/s;->c(Landroid/content/Context;I)F

    .line 144
    .line 145
    .line 146
    move-result p3

    .line 147
    float-to-int p3, p3

    .line 148
    goto :goto_7

    .line 149
    :cond_a
    move p3, v4

    .line 150
    :goto_7
    iget-object v3, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 151
    .line 152
    iget-boolean v3, v3, Lcom/google/android/material/tabs/e;->K:Z

    .line 153
    .line 154
    if-eqz v3, :cond_b

    .line 155
    .line 156
    invoke-static {p1}, LJ/k;->a(Landroid/view/ViewGroup$MarginLayoutParams;)I

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-eq p3, v3, :cond_c

    .line 161
    .line 162
    invoke-static {p1, p3}, LJ/k;->c(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 163
    .line 164
    .line 165
    iput v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 166
    .line 167
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p2}, Landroid/widget/ImageView;->requestLayout()V

    .line 171
    .line 172
    .line 173
    goto :goto_8

    .line 174
    :cond_b
    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 175
    .line 176
    if-eq p3, v3, :cond_c

    .line 177
    .line 178
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 179
    .line 180
    invoke-static {p1, v4}, LJ/k;->c(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p2}, Landroid/widget/ImageView;->requestLayout()V

    .line 187
    .line 188
    .line 189
    :cond_c
    :goto_8
    iget-object p1, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 190
    .line 191
    if-eqz p1, :cond_d

    .line 192
    .line 193
    invoke-static {p1}, Lcom/google/android/material/tabs/e$g;->c(Lcom/google/android/material/tabs/e$g;)Ljava/lang/CharSequence;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    :cond_d
    if-nez v0, :cond_e

    .line 198
    .line 199
    goto :goto_9

    .line 200
    :cond_e
    move-object v2, v1

    .line 201
    :goto_9
    invoke-static {p0, v2}, Landroidx/appcompat/widget/f0;->a(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 202
    .line 203
    .line 204
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->drawableStateChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->o:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->o:Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method getContentHeight()I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    new-array v3, v2, [Landroid/view/View;

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput-object v0, v3, v4

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aput-object v1, v3, v0

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    aput-object p0, v3, v1

    .line 18
    .line 19
    move p0, v4

    .line 20
    move v1, p0

    .line 21
    move v5, v1

    .line 22
    :goto_0
    if-ge v4, v2, :cond_3

    .line 23
    .line 24
    aget-object v6, v3, v4

    .line 25
    .line 26
    if-eqz v6, :cond_2

    .line 27
    .line 28
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    if-nez v7, :cond_2

    .line 33
    .line 34
    if-eqz v5, :cond_0

    .line 35
    .line 36
    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    :goto_1
    if-eqz v5, :cond_1

    .line 50
    .line 51
    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    invoke-static {p0, v5}, Ljava/lang/Math;->max(II)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    goto :goto_2

    .line 60
    :cond_1
    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    :goto_2
    move v5, v0

    .line 65
    :cond_2
    add-int/2addr v4, v0

    .line 66
    goto :goto_0

    .line 67
    :cond_3
    sub-int/2addr p0, v1

    .line 68
    return p0
.end method

.method getContentWidth()I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    new-array v3, v2, [Landroid/view/View;

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput-object v0, v3, v4

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aput-object v1, v3, v0

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    aput-object p0, v3, v1

    .line 18
    .line 19
    move p0, v4

    .line 20
    move v1, p0

    .line 21
    move v5, v1

    .line 22
    :goto_0
    if-ge v4, v2, :cond_3

    .line 23
    .line 24
    aget-object v6, v3, v4

    .line 25
    .line 26
    if-eqz v6, :cond_2

    .line 27
    .line 28
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    if-nez v7, :cond_2

    .line 33
    .line 34
    if-eqz v5, :cond_0

    .line 35
    .line 36
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    :goto_1
    if-eqz v5, :cond_1

    .line 50
    .line 51
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    invoke-static {p0, v5}, Ljava/lang/Math;->max(II)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    goto :goto_2

    .line 60
    :cond_1
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    :goto_2
    move v5, v0

    .line 65
    :cond_2
    add-int/2addr v4, v0

    .line 66
    goto :goto_0

    .line 67
    :cond_3
    sub-int/2addr p0, v1

    .line 68
    return p0
.end method

.method public getTab()Lcom/google/android/material/tabs/e$g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 2
    .line 3
    return-object p0
.end method

.method n()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/e$i;->setTab(Lcom/google/android/material/tabs/e$g;)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/e$i;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, LK/d;->P0(Landroid/view/accessibility/AccessibilityNodeInfo;)LK/d;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->k:LZ2/a;

    .line 19
    .line 20
    invoke-virtual {v0}, LZ2/a;->h()Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, LK/d;->m0(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e$g;->g()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/4 v5, 0x0

    .line 34
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isSelected()Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    const/4 v1, 0x0

    .line 39
    const/4 v2, 0x1

    .line 40
    const/4 v4, 0x1

    .line 41
    invoke-static/range {v1 .. v6}, LK/d$f;->g(IIIIZZ)LK/d$f;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p1, v0}, LK/d;->l0(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isSelected()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-virtual {p1, v0}, LK/d;->j0(Z)V

    .line 56
    .line 57
    .line 58
    sget-object v0, LK/d$a;->i:LK/d$a;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, LK/d;->b0(LK/d$a;)Z

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget v0, LX2/j;->h:I

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, LK/d;->D0(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public onMeasure(II)V
    .locals 7

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/google/android/material/tabs/e;->getTabMaxWidth()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-lez v2, :cond_1

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    if-le v0, v2, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 22
    .line 23
    iget p1, p1, Lcom/google/android/material/tabs/e;->B:I

    .line 24
    .line 25
    const/high16 v0, -0x80000000

    .line 26
    .line 27
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 35
    .line 36
    if-eqz v0, :cond_7

    .line 37
    .line 38
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 39
    .line 40
    iget v0, v0, Lcom/google/android/material/tabs/e;->x:F

    .line 41
    .line 42
    iget v1, p0, Lcom/google/android/material/tabs/e$i;->p:I

    .line 43
    .line 44
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    invoke-virtual {v2}, Landroid/widget/ImageView;->getVisibility()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_2

    .line 54
    .line 55
    move v1, v3

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 58
    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    invoke-virtual {v2}, Landroid/widget/TextView;->getLineCount()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-le v2, v3, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 68
    .line 69
    iget v0, v0, Lcom/google/android/material/tabs/e;->z:F

    .line 70
    .line 71
    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 72
    .line 73
    invoke-virtual {v2}, Landroid/widget/TextView;->getTextSize()F

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    iget-object v4, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-virtual {v4}, Landroid/widget/TextView;->getLineCount()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    iget-object v5, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 84
    .line 85
    invoke-static {v5}, Landroidx/core/widget/i;->d(Landroid/widget/TextView;)I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    cmpl-float v2, v0, v2

    .line 90
    .line 91
    if-nez v2, :cond_4

    .line 92
    .line 93
    if-ltz v5, :cond_7

    .line 94
    .line 95
    if-eq v1, v5, :cond_7

    .line 96
    .line 97
    :cond_4
    iget-object v5, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 98
    .line 99
    iget v5, v5, Lcom/google/android/material/tabs/e;->J:I

    .line 100
    .line 101
    const/4 v6, 0x0

    .line 102
    if-ne v5, v3, :cond_6

    .line 103
    .line 104
    if-lez v2, :cond_6

    .line 105
    .line 106
    if-ne v4, v3, :cond_6

    .line 107
    .line 108
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 109
    .line 110
    invoke-virtual {v2}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    if-eqz v2, :cond_5

    .line 115
    .line 116
    invoke-direct {p0, v2, v6, v0}, Lcom/google/android/material/tabs/e$i;->g(Landroid/text/Layout;IF)F

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    sub-int/2addr v3, v4

    .line 129
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    sub-int/2addr v3, v4

    .line 134
    int-to-float v3, v3

    .line 135
    cmpl-float v2, v2, v3

    .line 136
    .line 137
    if-lez v2, :cond_6

    .line 138
    .line 139
    :cond_5
    return-void

    .line 140
    :cond_6
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 141
    .line 142
    invoke-virtual {v2, v6, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 148
    .line 149
    .line 150
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 151
    .line 152
    .line 153
    :cond_7
    return-void
.end method

.method public performClick()Z
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->performClick()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->playSoundEffect(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/google/android/material/tabs/e$g;->l()V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_1
    return v0
.end method

.method final s()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/tabs/e$i;->v()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e$g;->j()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/e$i;->setSelected(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setSelected(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isSelected()Z

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 26
    .line 27
    .line 28
    :cond_2
    return-void
.end method

.method setTab(Lcom/google/android/material/tabs/e$g;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/tabs/e$i;->s()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method final u()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/google/android/material/tabs/e;->K:Z

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    xor-int/2addr v0, v1

    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->m:Landroid/widget/TextView;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->n:Landroid/widget/ImageView;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 22
    .line 23
    invoke-direct {p0, v0, v2, v1}, Lcom/google/android/material/tabs/e$i;->w(Landroid/widget/TextView;Landroid/widget/ImageView;Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->n:Landroid/widget/ImageView;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/material/tabs/e$i;->w(Landroid/widget/TextView;Landroid/widget/ImageView;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method final v()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$i;->g:Lcom/google/android/material/tabs/e$g;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e$g;->e()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v2, v1

    .line 12
    :goto_0
    if-eqz v2, :cond_7

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    if-eq v3, p0, :cond_3

    .line 19
    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    check-cast v3, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v3, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 28
    .line 29
    if-eqz v3, :cond_2

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    check-cast v3, Landroid/view/ViewGroup;

    .line 38
    .line 39
    iget-object v4, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iput-object v2, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 48
    .line 49
    iget-object v3, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 50
    .line 51
    const/16 v4, 0x8

    .line 52
    .line 53
    if-eqz v3, :cond_4

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    :cond_4
    iget-object v3, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 59
    .line 60
    if-eqz v3, :cond_5

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    iget-object v3, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 66
    .line 67
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    :cond_5
    const v1, 0x1020014

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Landroid/widget/TextView;

    .line 78
    .line 79
    iput-object v1, p0, Lcom/google/android/material/tabs/e$i;->m:Landroid/widget/TextView;

    .line 80
    .line 81
    if-eqz v1, :cond_6

    .line 82
    .line 83
    invoke-static {v1}, Landroidx/core/widget/i;->d(Landroid/widget/TextView;)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iput v1, p0, Lcom/google/android/material/tabs/e$i;->p:I

    .line 88
    .line 89
    :cond_6
    const v1, 0x1020006

    .line 90
    .line 91
    .line 92
    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Landroid/widget/ImageView;

    .line 97
    .line 98
    iput-object v1, p0, Lcom/google/android/material/tabs/e$i;->n:Landroid/widget/ImageView;

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_7
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 102
    .line 103
    if-eqz v2, :cond_8

    .line 104
    .line 105
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    iput-object v1, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 109
    .line 110
    :cond_8
    iput-object v1, p0, Lcom/google/android/material/tabs/e$i;->m:Landroid/widget/TextView;

    .line 111
    .line 112
    iput-object v1, p0, Lcom/google/android/material/tabs/e$i;->n:Landroid/widget/ImageView;

    .line 113
    .line 114
    :goto_1
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->l:Landroid/view/View;

    .line 115
    .line 116
    if-nez v1, :cond_d

    .line 117
    .line 118
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 119
    .line 120
    if-nez v1, :cond_9

    .line 121
    .line 122
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->l()V

    .line 123
    .line 124
    .line 125
    :cond_9
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 126
    .line 127
    if-nez v1, :cond_a

    .line 128
    .line 129
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->m()V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 133
    .line 134
    invoke-static {v1}, Landroidx/core/widget/i;->d(Landroid/widget/TextView;)I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    iput v1, p0, Lcom/google/android/material/tabs/e$i;->p:I

    .line 139
    .line 140
    :cond_a
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 141
    .line 142
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 143
    .line 144
    invoke-static {v2}, Lcom/google/android/material/tabs/e;->a(Lcom/google/android/material/tabs/e;)I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    invoke-static {v1, v2}, Landroidx/core/widget/i;->o(Landroid/widget/TextView;I)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isSelected()Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_b

    .line 156
    .line 157
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 158
    .line 159
    invoke-static {v1}, Lcom/google/android/material/tabs/e;->b(Lcom/google/android/material/tabs/e;)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    const/4 v2, -0x1

    .line 164
    if-eq v1, v2, :cond_b

    .line 165
    .line 166
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 167
    .line 168
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 169
    .line 170
    invoke-static {v2}, Lcom/google/android/material/tabs/e;->b(Lcom/google/android/material/tabs/e;)I

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    invoke-static {v1, v2}, Landroidx/core/widget/i;->o(Landroid/widget/TextView;I)V

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_b
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 179
    .line 180
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 181
    .line 182
    invoke-static {v2}, Lcom/google/android/material/tabs/e;->c(Lcom/google/android/material/tabs/e;)I

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    invoke-static {v1, v2}, Landroidx/core/widget/i;->o(Landroid/widget/TextView;I)V

    .line 187
    .line 188
    .line 189
    :goto_2
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->q:Lcom/google/android/material/tabs/e;

    .line 190
    .line 191
    iget-object v1, v1, Lcom/google/android/material/tabs/e;->r:Landroid/content/res/ColorStateList;

    .line 192
    .line 193
    if-eqz v1, :cond_c

    .line 194
    .line 195
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 196
    .line 197
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 198
    .line 199
    .line 200
    :cond_c
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 201
    .line 202
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 203
    .line 204
    const/4 v3, 0x1

    .line 205
    invoke-direct {p0, v1, v2, v3}, Lcom/google/android/material/tabs/e$i;->w(Landroid/widget/TextView;Landroid/widget/ImageView;Z)V

    .line 206
    .line 207
    .line 208
    invoke-direct {p0}, Lcom/google/android/material/tabs/e$i;->q()V

    .line 209
    .line 210
    .line 211
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->i:Landroid/widget/ImageView;

    .line 212
    .line 213
    invoke-direct {p0, v1}, Lcom/google/android/material/tabs/e$i;->f(Landroid/view/View;)V

    .line 214
    .line 215
    .line 216
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->h:Landroid/widget/TextView;

    .line 217
    .line 218
    invoke-direct {p0, v1}, Lcom/google/android/material/tabs/e$i;->f(Landroid/view/View;)V

    .line 219
    .line 220
    .line 221
    goto :goto_3

    .line 222
    :cond_d
    iget-object v1, p0, Lcom/google/android/material/tabs/e$i;->m:Landroid/widget/TextView;

    .line 223
    .line 224
    if-nez v1, :cond_e

    .line 225
    .line 226
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->n:Landroid/widget/ImageView;

    .line 227
    .line 228
    if-eqz v2, :cond_f

    .line 229
    .line 230
    :cond_e
    iget-object v2, p0, Lcom/google/android/material/tabs/e$i;->n:Landroid/widget/ImageView;

    .line 231
    .line 232
    const/4 v3, 0x0

    .line 233
    invoke-direct {p0, v1, v2, v3}, Lcom/google/android/material/tabs/e$i;->w(Landroid/widget/TextView;Landroid/widget/ImageView;Z)V

    .line 234
    .line 235
    .line 236
    :cond_f
    :goto_3
    if-eqz v0, :cond_10

    .line 237
    .line 238
    invoke-static {v0}, Lcom/google/android/material/tabs/e$g;->c(Lcom/google/android/material/tabs/e$g;)Ljava/lang/CharSequence;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-nez v1, :cond_10

    .line 247
    .line 248
    invoke-static {v0}, Lcom/google/android/material/tabs/e$g;->c(Lcom/google/android/material/tabs/e$g;)Ljava/lang/CharSequence;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 253
    .line 254
    .line 255
    :cond_10
    return-void
.end method
