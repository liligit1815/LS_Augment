.class public Lcom/google/android/material/tabs/e$g;
.super Ljava/lang/Object;
.source "TabLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/tabs/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# instance fields
.field private a:Ljava/lang/Object;

.field private b:Landroid/graphics/drawable/Drawable;

.field private c:Ljava/lang/CharSequence;

.field private d:Ljava/lang/CharSequence;

.field private e:I

.field private f:Landroid/view/View;

.field private g:I

.field public h:Lcom/google/android/material/tabs/e;

.field public i:Lcom/google/android/material/tabs/e$i;

.field private j:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/google/android/material/tabs/e$g;->e:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput v1, p0, Lcom/google/android/material/tabs/e$g;->g:I

    .line 9
    .line 10
    iput v0, p0, Lcom/google/android/material/tabs/e$g;->j:I

    .line 11
    .line 12
    return-void
.end method

.method static synthetic a(Lcom/google/android/material/tabs/e$g;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/tabs/e$g;->j:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic b(Lcom/google/android/material/tabs/e$g;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/tabs/e$g;->g:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic c(Lcom/google/android/material/tabs/e$g;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$g;->d:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic d(Lcom/google/android/material/tabs/e$g;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$g;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public e()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$g;->f:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$g;->b:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/tabs/e$g;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/tabs/e$g;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$g;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$g;->h:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/google/android/material/tabs/e;->getSelectedTabPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    iget p0, p0, Lcom/google/android/material/tabs/e$g;->e:I

    .line 13
    .line 14
    if-ne v0, p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 21
    .line 22
    const-string v0, "Tab not attached to a TabLayout"

    .line 23
    .line 24
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method

.method k()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/google/android/material/tabs/e$g;->h:Lcom/google/android/material/tabs/e;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/google/android/material/tabs/e$g;->i:Lcom/google/android/material/tabs/e$i;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/material/tabs/e$g;->a:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/google/android/material/tabs/e$g;->b:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    iput v1, p0, Lcom/google/android/material/tabs/e$g;->j:I

    .line 12
    .line 13
    iput-object v0, p0, Lcom/google/android/material/tabs/e$g;->c:Ljava/lang/CharSequence;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/google/android/material/tabs/e$g;->d:Ljava/lang/CharSequence;

    .line 16
    .line 17
    iput v1, p0, Lcom/google/android/material/tabs/e$g;->e:I

    .line 18
    .line 19
    iput-object v0, p0, Lcom/google/android/material/tabs/e$g;->f:Landroid/view/View;

    .line 20
    .line 21
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$g;->h:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/google/android/material/tabs/e;->K(Lcom/google/android/material/tabs/e$g;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 10
    .line 11
    const-string v0, "Tab not attached to a TabLayout"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public m(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/e$g;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/tabs/e$g;->d:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/e$g;->s()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public n(I)Lcom/google/android/material/tabs/e$g;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$g;->i:Lcom/google/android/material/tabs/e$i;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/google/android/material/tabs/e$g;->i:Lcom/google/android/material/tabs/e$i;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/e$g;->o(Landroid/view/View;)Lcom/google/android/material/tabs/e$g;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public o(Landroid/view/View;)Lcom/google/android/material/tabs/e$g;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/tabs/e$g;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/e$g;->s()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public p(Landroid/graphics/drawable/Drawable;)Lcom/google/android/material/tabs/e$g;
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/google/android/material/tabs/e$g;->b:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/material/tabs/e$g;->h:Lcom/google/android/material/tabs/e;

    .line 4
    .line 5
    iget v0, p1, Lcom/google/android/material/tabs/e;->G:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget v0, p1, Lcom/google/android/material/tabs/e;->J:I

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p1, v1}, Lcom/google/android/material/tabs/e;->U(Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/material/tabs/e$g;->s()V

    .line 19
    .line 20
    .line 21
    sget-boolean p1, LZ2/c;->a:Z

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Lcom/google/android/material/tabs/e$g;->i:Lcom/google/android/material/tabs/e$i;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/google/android/material/tabs/e$i;->d(Lcom/google/android/material/tabs/e$i;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget-object p1, p0, Lcom/google/android/material/tabs/e$g;->i:Lcom/google/android/material/tabs/e$i;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/google/android/material/tabs/e$i;->e(Lcom/google/android/material/tabs/e$i;)LZ2/a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    iget-object p1, p0, Lcom/google/android/material/tabs/e$g;->i:Lcom/google/android/material/tabs/e$i;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->invalidate()V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-object p0
.end method

.method q(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/material/tabs/e$g;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public r(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/e$g;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/e$g;->d:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/material/tabs/e$g;->i:Lcom/google/android/material/tabs/e$i;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iput-object p1, p0, Lcom/google/android/material/tabs/e$g;->c:Ljava/lang/CharSequence;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/material/tabs/e$g;->s()V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method s()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/e$g;->i:Lcom/google/android/material/tabs/e$i;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/tabs/e$i;->s()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
