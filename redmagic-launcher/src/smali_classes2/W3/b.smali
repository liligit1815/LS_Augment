.class public LW3/b;
.super Landroidx/appcompat/app/c;
.source "BaseSinkActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LW3/b$j;,
        LW3/b$k;
    }
.end annotation


# instance fields
.field protected A:Landroid/widget/ImageView;

.field protected B:Landroid/widget/ImageView;

.field protected C:Landroid/widget/ImageView;

.field protected i:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field protected j:Landroidx/appcompat/widget/Toolbar;

.field protected k:Lcom/google/android/material/appbar/AppBarLayout;

.field private l:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

.field protected m:Landroid/widget/TextView;

.field protected n:Landroid/widget/TextView;

.field private o:Lcom/zte/mifavor/widget/a;

.field private p:Z

.field protected q:Z

.field private r:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "LW3/b$k;",
            ">;"
        }
    .end annotation
.end field

.field private s:Landroidx/recyclerview/widget/RecyclerView;

.field private t:Z

.field private u:I

.field private v:Z

.field private w:I

.field private x:I

.field private y:LW3/b$j;

.field protected z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/c;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LW3/b;->p:Z

    .line 6
    .line 7
    iput-boolean v0, p0, LW3/b;->q:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, LW3/b;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    iput-boolean v2, p0, LW3/b;->t:Z

    .line 14
    .line 15
    iput v0, p0, LW3/b;->u:I

    .line 16
    .line 17
    iput-boolean v0, p0, LW3/b;->v:Z

    .line 18
    .line 19
    iput v0, p0, LW3/b;->w:I

    .line 20
    .line 21
    iput v0, p0, LW3/b;->x:I

    .line 22
    .line 23
    iput-object v1, p0, LW3/b;->y:LW3/b$j;

    .line 24
    .line 25
    iput-object v1, p0, LW3/b;->z:Landroid/widget/TextView;

    .line 26
    .line 27
    iput-object v1, p0, LW3/b;->A:Landroid/widget/ImageView;

    .line 28
    .line 29
    iput-object v1, p0, LW3/b;->B:Landroid/widget/ImageView;

    .line 30
    .line 31
    iput-object v1, p0, LW3/b;->C:Landroid/widget/ImageView;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic D(LW3/b;ZLandroid/view/View;LJ/Y;)LJ/Y;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LW3/b;->d0(ZLandroid/view/View;LJ/Y;)LJ/Y;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic E(LW3/b;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, LW3/b;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic F(LW3/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LW3/b;->K()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic G(LW3/b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LW3/b;->f0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic H(LW3/b;Lcom/google/android/material/appbar/AppBarLayout$Behavior$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LW3/b;->g0(Lcom/google/android/material/appbar/AppBarLayout$Behavior$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic I(LW3/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LW3/b;->l0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic J(LW3/b;Landroid/widget/TextView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LW3/b;->m0(Landroid/widget/TextView;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private K()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "one_handed_state"

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Lb4/d;->d(Landroid/content/res/Resources;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->isInMultiWindowMode()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    new-instance v3, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v4, "Judge The System Mode Then Update Sink State STRING_ONEHAND_STATE="

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v4, ", bIsLand="

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v4, ", bIsMulWinMode= "

    .line 50
    .line 51
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    const-string v4, "BS#BaseSinkActivity"

    .line 62
    .line 63
    invoke-static {v4, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    const/4 v3, 0x1

    .line 67
    if-eq v3, v0, :cond_1

    .line 68
    .line 69
    if-nez v1, :cond_1

    .line 70
    .line 71
    if-eqz v2, :cond_0

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const/4 v0, 0x0

    .line 75
    invoke-virtual {p0, v0}, LW3/b;->O(Z)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    :goto_0
    iget-object v0, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 80
    .line 81
    new-instance v1, LW3/b$i;

    .line 82
    .line 83
    invoke-direct {v1, p0}, LW3/b$i;-><init>(LW3/b;)V

    .line 84
    .line 85
    .line 86
    const-wide/16 v2, 0x64

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method private M(Landroid/view/View;Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, LW3/b;->i:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    const-string p1, "BS#BaseSinkActivity"

    .line 9
    .line 10
    const-string p2, "addToRootCoordinatorLy, Exception"

    .line 11
    .line 12
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private N(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, LW3/b;->i:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-gez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    new-instance v0, LW3/b$e;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, LW3/b$e;-><init>(LW3/b;Landroid/widget/TextView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private P(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_3

    .line 11
    .line 12
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    instance-of v4, v3, Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    if-eqz v4, :cond_1

    .line 19
    .line 20
    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    .line 21
    .line 22
    return-object v3

    .line 23
    :cond_1
    instance-of v4, v3, Landroid/view/ViewGroup;

    .line 24
    .line 25
    if-eqz v4, :cond_2

    .line 26
    .line 27
    check-cast v3, Landroid/view/ViewGroup;

    .line 28
    .line 29
    invoke-direct {p0, v3}, LW3/b;->P(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    return-object v3

    .line 36
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_3
    return-object v0
.end method

.method private U()V
    .locals 4

    .line 1
    iget-object v0, p0, LW3/b;->j:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    new-instance v1, LW3/b$f;

    .line 4
    .line 5
    invoke-direct {v1, p0}, LW3/b$f;-><init>(LW3/b;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x64

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private W()V
    .locals 2

    .line 1
    :try_start_0
    sget v0, LR3/g;->h:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    .line 8
    .line 9
    iput-object v0, p0, LW3/b;->j:Landroidx/appcompat/widget/Toolbar;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->z(Landroidx/appcompat/widget/Toolbar;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->p()Landroidx/appcompat/app/a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/a;->n(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    const-string v0, "BS#BaseSinkActivity"

    .line 25
    .line 26
    const-string v1, "init Action Bar error, e = "

    .line 27
    .line 28
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private X()V
    .locals 3

    .line 1
    invoke-direct {p0}, LW3/b;->K()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LW3/b;->r:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void

    .line 16
    :cond_1
    :goto_0
    new-instance v0, LW3/b$k;

    .line 17
    .line 18
    invoke-direct {v0, p0}, LW3/b$k;-><init>(LW3/b;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, LW3/b;->r:Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v1, "one_handed_state"

    .line 37
    .line 38
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const/4 v2, 0x1

    .line 43
    invoke-virtual {p0, v1, v2, v0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private Z(Ljava/lang/String;ZZZILjava/lang/String;I)V
    .locals 3

    .line 1
    iget-object v0, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 12
    .line 13
    sget v1, LR3/g;->f:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVerticalScrollBarEnabled(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 30
    .line 31
    const/4 v2, 0x5

    .line 32
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 36
    .line 37
    sget v2, LR3/l;->i:I

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget v2, LR3/e;->V:I

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    int-to-float v0, v0

    .line 53
    iget-object v2, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {v2, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 59
    .line 60
    const/4 v1, -0x2

    .line 61
    invoke-direct {v0, p7, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;-><init>(II)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 65
    .line 66
    .line 67
    move-object p5, p6

    .line 68
    move-object p6, p1

    .line 69
    move-object p1, p0

    .line 70
    new-instance p0, Lcom/zte/mifavor/androidx/behavior/SecondaryGroupTitleBehavior;

    .line 71
    .line 72
    invoke-direct/range {p0 .. p6}, Lcom/zte/mifavor/androidx/behavior/SecondaryGroupTitleBehavior;-><init>(Landroid/content/Context;ZZZLjava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget p2, p1, LW3/b;->u:I

    .line 76
    .line 77
    invoke-virtual {p0, p2}, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->J(I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->o(Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p1, LW3/b;->n:Landroid/widget/TextView;

    .line 84
    .line 85
    invoke-direct {p1, p0, v0}, LW3/b;->M(Landroid/view/View;Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method private b0(Ljava/lang/String;Ljava/lang/String;ZZZZ)V
    .locals 10

    .line 1
    if-eqz p1, :cond_10

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    iget-boolean v1, p0, LW3/b;->q:Z

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v1, :cond_5

    .line 15
    .line 16
    iget-object v1, p0, LW3/b;->A:Landroid/widget/ImageView;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, LW3/b;->z:Landroid/widget/TextView;

    .line 21
    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    :cond_1
    invoke-virtual {p0, p1, p3}, LW3/b;->L(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object v1, p0, LW3/b;->z:Landroid/widget/TextView;

    .line 28
    .line 29
    if-eqz v1, :cond_3

    .line 30
    .line 31
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    :cond_3
    iget-object v1, p0, LW3/b;->A:Landroid/widget/ImageView;

    .line 35
    .line 36
    if-eqz v1, :cond_10

    .line 37
    .line 38
    if-eqz p3, :cond_4

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_4
    const/16 v3, 0x8

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, LW3/b;->A:Landroid/widget/ImageView;

    .line 47
    .line 48
    new-instance v2, LW3/b$a;

    .line 49
    .line 50
    invoke-direct {v2, p0}, LW3/b$a;-><init>(LW3/b;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_5
    iget v1, p0, LW3/b;->u:I

    .line 58
    .line 59
    if-nez v1, :cond_6

    .line 60
    .line 61
    invoke-static {p0}, Lb4/d;->c(Landroid/content/Context;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iput v1, p0, LW3/b;->u:I

    .line 66
    .line 67
    :cond_6
    if-eqz p6, :cond_7

    .line 68
    .line 69
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    sget v4, LR3/e;->d0:I

    .line 74
    .line 75
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    :goto_1
    move v8, v1

    .line 80
    goto :goto_2

    .line 81
    :cond_7
    if-eqz p3, :cond_8

    .line 82
    .line 83
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    sget v4, LR3/e;->P:I

    .line 88
    .line 89
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    goto :goto_1

    .line 94
    :cond_8
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    sget v4, LR3/e;->d0:I

    .line 99
    .line 100
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    goto :goto_1

    .line 105
    :goto_2
    iget-object v1, p0, LW3/b;->m:Landroid/widget/TextView;

    .line 106
    .line 107
    if-nez v1, :cond_c

    .line 108
    .line 109
    new-instance v1, Landroid/widget/TextView;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 112
    .line 113
    .line 114
    iput-object v1, p0, LW3/b;->m:Landroid/widget/TextView;

    .line 115
    .line 116
    sget v4, LR3/g;->e:I

    .line 117
    .line 118
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setId(I)V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, LW3/b;->m:Landroid/widget/TextView;

    .line 122
    .line 123
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVerticalScrollBarEnabled(Z)V

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, LW3/b;->m:Landroid/widget/TextView;

    .line 127
    .line 128
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, LW3/b;->m:Landroid/widget/TextView;

    .line 132
    .line 133
    const/4 v3, 0x5

    .line 134
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 135
    .line 136
    .line 137
    new-instance v9, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 138
    .line 139
    iget v1, p0, LW3/b;->u:I

    .line 140
    .line 141
    const/4 v3, -0x2

    .line 142
    invoke-direct {v9, v1, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;-><init>(II)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v9, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 146
    .line 147
    .line 148
    if-eqz p2, :cond_b

    .line 149
    .line 150
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_9

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_9
    new-instance v0, Lcom/zte/mifavor/androidx/behavior/PrimaryGroupTitleBehavior;

    .line 158
    .line 159
    move-object v1, p0

    .line 160
    move-object v6, p1

    .line 161
    move-object v7, p2

    .line 162
    move v2, p3

    .line 163
    move v3, p4

    .line 164
    move v4, p5

    .line 165
    move/from16 v5, p6

    .line 166
    .line 167
    invoke-direct/range {v0 .. v7}, Lcom/zte/mifavor/androidx/behavior/PrimaryGroupTitleBehavior;-><init>(Landroid/content/Context;ZZZZLjava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    move-object v1, v0

    .line 171
    iget v2, p0, LW3/b;->u:I

    .line 172
    .line 173
    invoke-virtual {v1, v2}, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->J(I)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v9, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->o(Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;)V

    .line 177
    .line 178
    .line 179
    iget-object v1, p0, LW3/b;->m:Landroid/widget/TextView;

    .line 180
    .line 181
    invoke-direct {p0, v1, v9}, LW3/b;->M(Landroid/view/View;Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;)V

    .line 182
    .line 183
    .line 184
    iget-object v1, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 185
    .line 186
    if-nez v1, :cond_a

    .line 187
    .line 188
    iget v7, p0, LW3/b;->u:I

    .line 189
    .line 190
    move-object v0, p0

    .line 191
    move-object v6, p1

    .line 192
    move-object v1, p2

    .line 193
    move v2, p3

    .line 194
    move v3, p5

    .line 195
    move/from16 v4, p6

    .line 196
    .line 197
    move v5, v8

    .line 198
    invoke-direct/range {v0 .. v7}, LW3/b;->Z(Ljava/lang/String;ZZZILjava/lang/String;I)V

    .line 199
    .line 200
    .line 201
    goto :goto_4

    .line 202
    :cond_a
    invoke-direct {p0, p2}, LW3/b;->k0(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    goto :goto_4

    .line 206
    :cond_b
    :goto_3
    new-instance v0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;

    .line 207
    .line 208
    move-object v1, p0

    .line 209
    move-object v5, p1

    .line 210
    move v2, p3

    .line 211
    move v3, p4

    .line 212
    move/from16 v4, p6

    .line 213
    .line 214
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;-><init>(Landroid/content/Context;ZZZLjava/lang/String;)V

    .line 215
    .line 216
    .line 217
    move-object v1, v0

    .line 218
    iget v2, p0, LW3/b;->u:I

    .line 219
    .line 220
    invoke-virtual {v1, v2}, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->J(I)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v9, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->o(Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;)V

    .line 224
    .line 225
    .line 226
    iget-object v1, p0, LW3/b;->m:Landroid/widget/TextView;

    .line 227
    .line 228
    invoke-direct {p0, v1, v9}, LW3/b;->M(Landroid/view/View;Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;)V

    .line 229
    .line 230
    .line 231
    goto :goto_4

    .line 232
    :cond_c
    move v5, v8

    .line 233
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 234
    .line 235
    .line 236
    if-eqz p2, :cond_f

    .line 237
    .line 238
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    if-eqz v1, :cond_d

    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_d
    iget-object v1, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 246
    .line 247
    if-nez v1, :cond_e

    .line 248
    .line 249
    iget v7, p0, LW3/b;->u:I

    .line 250
    .line 251
    move-object v0, p0

    .line 252
    move-object v6, p1

    .line 253
    move-object v1, p2

    .line 254
    move v2, p3

    .line 255
    move v3, p5

    .line 256
    move/from16 v4, p6

    .line 257
    .line 258
    invoke-direct/range {v0 .. v7}, LW3/b;->Z(Ljava/lang/String;ZZZILjava/lang/String;I)V

    .line 259
    .line 260
    .line 261
    goto :goto_4

    .line 262
    :cond_e
    invoke-direct {p0, p2}, LW3/b;->k0(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    :cond_f
    :goto_4
    invoke-direct {p0}, LW3/b;->U()V

    .line 266
    .line 267
    .line 268
    :cond_10
    :goto_5
    return-void
.end method

.method private c0()V
    .locals 3

    .line 1
    sget v0, LR3/g;->g:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 8
    .line 9
    iput-object v0, p0, LW3/b;->i:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 10
    .line 11
    sget v0, LR3/g;->c:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 18
    .line 19
    iput-object v0, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 26
    .line 27
    iget-object v1, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :goto_0
    invoke-direct {v2, v1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;-><init>(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->o(Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    sget v0, LR3/g;->d:I

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    .line 60
    .line 61
    iput-object v0, p0, LW3/b;->l:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    .line 62
    .line 63
    return-void
.end method

.method private synthetic d0(ZLandroid/view/View;LJ/Y;)LJ/Y;
    .locals 4

    .line 1
    const-string v0, "BS#BaseSinkActivity"

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, LJ/Y$k;->h()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p3, v1}, LJ/Y;->f(I)LB/b;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 16
    .line 17
    iget v2, p3, LB/b;->a:I

    .line 18
    .line 19
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 20
    .line 21
    iget v2, p3, LB/b;->c:I

    .line 22
    .line 23
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 24
    .line 25
    iget v2, p3, LB/b;->b:I

    .line 26
    .line 27
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget p1, p3, LB/b;->d:I

    .line 38
    .line 39
    iput p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 40
    .line 41
    :goto_0
    iput v2, p0, LW3/b;->w:I

    .line 42
    .line 43
    iget p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 44
    .line 45
    iput p1, p0, LW3/b;->x:I

    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    .line 56
    .line 57
    invoke-static {}, Lcom/zte/mifavor/widget/u;->g()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    const/4 v2, 0x2

    .line 62
    if-ne p1, v2, :cond_1

    .line 63
    .line 64
    invoke-static {p3}, Lb4/g;->i(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    if-eqz p3, :cond_1

    .line 69
    .line 70
    invoke-static {}, Lb4/g;->c()I

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    iput p3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 75
    .line 76
    invoke-static {p0}, Lb4/g;->d(Landroid/content/Context;)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    iput p0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 81
    .line 82
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 83
    .line 84
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    const-string p3, "set Layout Margin. leftMargin="

    .line 90
    .line 91
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget p3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 95
    .line 96
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string p3, ", topMargin="

    .line 100
    .line 101
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget p3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 105
    .line 106
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string p3, ", rightMargin="

    .line 110
    .line 111
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget p3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 115
    .line 116
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string p3, ", bottomMargin="

    .line 120
    .line 121
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget p3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 125
    .line 126
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p3, ", clear the Window Insets Listener. orientation="

    .line 130
    .line 131
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .line 146
    .line 147
    goto :goto_2

    .line 148
    :goto_1
    const-string p1, "set Layout Margin error.e="

    .line 149
    .line 150
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 151
    .line 152
    .line 153
    :goto_2
    sget-object p0, LJ/Y;->b:LJ/Y;

    .line 154
    .line 155
    return-object p0
.end method

.method private e0()V
    .locals 3

    .line 1
    new-instance v0, LW3/b$j;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LW3/b$j;-><init>(LW3/b;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, LW3/b;->y:LW3/b$j;

    .line 7
    .line 8
    new-instance v0, Landroid/content/IntentFilter;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "zte.intent.action.status_bar_taped"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, LW3/b;->y:LW3/b$j;

    .line 19
    .line 20
    const/4 v2, 0x2

    .line 21
    invoke-virtual {p0, v1, v0, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private f0(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    instance-of v0, p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->X0(Z)V

    .line 26
    .line 27
    .line 28
    :cond_2
    :goto_0
    return-void
.end method

.method private g0(Lcom/google/android/material/appbar/AppBarLayout$Behavior$a;)V
    .locals 1

    .line 1
    iget-object p0, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    instance-of v0, p0, Lcom/google/android/material/appbar/AppBarLayout$Behavior;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout$Behavior;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$Behavior;->y0(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$c;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    :goto_0
    return-void
.end method

.method private j0()V
    .locals 1

    .line 1
    iget-object v0, p0, LW3/b;->y:LW3/b$j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, LW3/b;->y:LW3/b$j;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private k0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private l0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {p1}, LJ/I;->O(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, LW3/b;->j:Landroidx/appcompat/widget/Toolbar;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingStart()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, LW3/b;->j:Landroidx/appcompat/widget/Toolbar;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingEnd()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    add-int/2addr p1, v1

    .line 24
    add-int/2addr p1, v0

    .line 25
    iget-object v0, p0, LW3/b;->m:Landroid/widget/TextView;

    .line 26
    .line 27
    invoke-direct {p0, v0, p1}, LW3/b;->m0(Landroid/widget/TextView;I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-direct {p0, v0, p1}, LW3/b;->m0(Landroid/widget/TextView;I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, LW3/b$g;

    .line 41
    .line 42
    invoke-direct {v1, p0, p1}, LW3/b$g;-><init>(LW3/b;Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private m0(Landroid/widget/TextView;I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, LW3/b;->i:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-gez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    new-instance v0, LW3/b$h;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p2}, LW3/b$h;-><init>(LW3/b;Landroid/widget/TextView;I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public L(Ljava/lang/String;Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    instance-of p2, p1, Landroid/widget/FrameLayout;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    sget v0, LR3/e;->f:I

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    const v0, 0x1020002

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getPaddingStart()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    add-int/2addr v2, p2

    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {v0, v1, v2, p2, v3}, Landroid/view/View;->setPaddingRelative(IIII)V

    .line 48
    .line 49
    .line 50
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    sget v0, LR3/i;->a:I

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-virtual {p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 62
    .line 63
    const/4 v1, -0x1

    .line 64
    const/4 v2, -0x2

    .line 65
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 66
    .line 67
    .line 68
    const v1, 0x800033

    .line 69
    .line 70
    .line 71
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 72
    .line 73
    move-object v1, p1

    .line 74
    check-cast v1, Landroid/widget/FrameLayout;

    .line 75
    .line 76
    invoke-virtual {v1, p2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    sget v0, LR3/g;->c0:I

    .line 80
    .line 81
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Landroid/widget/TextView;

    .line 86
    .line 87
    iput-object v0, p0, LW3/b;->z:Landroid/widget/TextView;

    .line 88
    .line 89
    const v0, 0x102002c

    .line 90
    .line 91
    .line 92
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Landroid/widget/ImageView;

    .line 97
    .line 98
    iput-object v0, p0, LW3/b;->A:Landroid/widget/ImageView;

    .line 99
    .line 100
    sget v0, LR3/g;->v:I

    .line 101
    .line 102
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Landroid/widget/ImageView;

    .line 107
    .line 108
    iput-object v0, p0, LW3/b;->B:Landroid/widget/ImageView;

    .line 109
    .line 110
    sget v0, LR3/g;->z:I

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    check-cast p2, Landroid/widget/ImageView;

    .line 117
    .line 118
    iput-object p2, p0, LW3/b;->C:Landroid/widget/ImageView;

    .line 119
    .line 120
    sget p0, LR3/g;->c:I

    .line 121
    .line 122
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    check-cast p0, Landroid/view/ViewGroup;

    .line 127
    .line 128
    if-eqz p0, :cond_0

    .line 129
    .line 130
    const/16 p1, 0x8

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 133
    .line 134
    .line 135
    :cond_0
    return-void
.end method

.method protected O(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, LW3/b;->p:Z

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    iput-boolean v1, p0, LW3/b;->p:Z

    .line 11
    .line 12
    iget-object p1, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 13
    .line 14
    invoke-static {p1}, LJ/I;->O(Landroid/view/View;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    new-instance p1, LW3/b$b;

    .line 21
    .line 22
    invoke-direct {p1, p0}, LW3/b$b;-><init>(LW3/b;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, p1}, LW3/b;->g0(Lcom/google/android/material/appbar/AppBarLayout$Behavior$a;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0, v0}, LW3/b;->f0(Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p1, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, LW3/b$c;

    .line 39
    .line 40
    invoke-direct {v0, p0}, LW3/b$c;-><init>(LW3/b;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    iput-boolean v0, p0, LW3/b;->p:Z

    .line 48
    .line 49
    iget-object p1, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 50
    .line 51
    invoke-static {p1}, LJ/I;->O(Landroid/view/View;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    invoke-direct {p0, p1}, LW3/b;->g0(Lcom/google/android/material/appbar/AppBarLayout$Behavior$a;)V

    .line 59
    .line 60
    .line 61
    invoke-direct {p0, v1}, LW3/b;->f0(Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    iget-object p1, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v0, LW3/b$d;

    .line 72
    .line 73
    invoke-direct {v0, p0}, LW3/b$d;-><init>(LW3/b;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public S()I
    .locals 3

    .line 1
    iget-object v0, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getTop()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v2, LR3/e;->v:I

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object p0, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    add-int/2addr v1, v0

    .line 32
    if-le p0, v1, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x4

    .line 35
    return p0

    .line 36
    :cond_0
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_1
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-ne p0, v1, :cond_2

    .line 43
    .line 44
    const/4 p0, 0x2

    .line 45
    return p0

    .line 46
    :cond_2
    const/4 p0, 0x3

    .line 47
    return p0
.end method

.method public T()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LW3/b;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public V()Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x1020002

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-direct {p0, v0}, LW3/b;->P(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method protected Y(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, LW3/b;->k:Lcom/google/android/material/appbar/AppBarLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p1, v1}, Lcom/google/android/material/appbar/AppBarLayout;->x(ZZ)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, LW3/b;->m:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-direct {p0, p1}, LW3/b;->N(Landroid/widget/TextView;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, LW3/b;->n:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-direct {p0, p1}, LW3/b;->N(Landroid/widget/TextView;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected a0(Ljava/lang/String;Ljava/lang/String;ZZZ)V
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    invoke-direct/range {v0 .. v6}, LW3/b;->b0(Ljava/lang/String;Ljava/lang/String;ZZZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected h0(Z)V
    .locals 3

    .line 1
    sget v0, LR3/g;->g:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "set Layout Margin. isBottom="

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, ", rootContent="

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "BS#BaseSinkActivity"

    .line 33
    .line 34
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    const-string p0, "set Layout Margin. do nothing."

    .line 40
    .line 41
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    :try_start_0
    new-instance v1, LW3/a;

    .line 46
    .line 47
    invoke-direct {v1, p0, p1}, LW3/a;-><init>(LW3/b;Z)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, LJ/I;->y0(Landroid/view/View;LJ/x;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catch_0
    move-exception p0

    .line 55
    const-string p1, "set On Apply Window Insets Listener error. e="

    .line 56
    .line 57
    invoke-static {v2, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method protected i0(Z)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/zte/mifavor/widget/u;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lb4/g;->i(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "BS#BaseSinkActivity"

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string p0, "setOrientationLayoutMargin do nothing."

    .line 14
    .line 15
    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget v0, LR3/g;->g:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v3, "setOrientationLayoutMargin in. isLandscape="

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v3, ", rootContent="

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    .line 70
    .line 71
    const/4 v4, 0x2

    .line 72
    const/4 v5, 0x0

    .line 73
    if-ne v3, v4, :cond_1

    .line 74
    .line 75
    invoke-static {}, Lb4/g;->c()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 80
    .line 81
    invoke-static {p0}, Lb4/g;->d(Landroid/content/Context;)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 86
    .line 87
    iput v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    iput v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 91
    .line 92
    iput v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 93
    .line 94
    iget v3, p0, LW3/b;->x:I

    .line 95
    .line 96
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 97
    .line 98
    :goto_0
    iget p0, p0, LW3/b;->w:I

    .line 99
    .line 100
    iput p0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 101
    .line 102
    new-instance p0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v3, "set Orientation Layout Margin. leftMargin="

    .line 108
    .line 109
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 113
    .line 114
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v3, ", topMargin="

    .line 118
    .line 119
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 123
    .line 124
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v3, ", rightMargin="

    .line 128
    .line 129
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 133
    .line 134
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v3, ", bottomMargin="

    .line 138
    .line 139
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 143
    .line 144
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v3, ",  isLandscape="

    .line 148
    .line 149
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    .line 164
    .line 165
    :cond_2
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/activity/h;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, LW3/b;->q:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/c;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, LW3/b;->K()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/s;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget p1, LR3/i;->b:I

    .line 5
    .line 6
    invoke-super {p0, p1}, Landroidx/appcompat/app/c;->setContentView(I)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, LW3/b;->W()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, LW3/b;->c0()V

    .line 13
    .line 14
    .line 15
    new-instance p1, Lcom/zte/mifavor/widget/a;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/zte/mifavor/widget/a;-><init>(Landroid/app/Activity;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, LW3/b;->o:Lcom/zte/mifavor/widget/a;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/a;->i()V

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Lb4/g;->h(Landroid/content/Context;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput-boolean p1, p0, LW3/b;->q:Z

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-static {p0}, Lb4/g;->e(Landroid/content/Context;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    :cond_0
    invoke-virtual {p0, v0}, LW3/b;->O(Z)V

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-static {p0}, Lcom/zte/mifavor/widget/u;->n(Landroid/content/Context;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput-boolean p1, p0, LW3/b;->v:Z

    .line 48
    .line 49
    iget-boolean v1, p0, LW3/b;->t:Z

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0, p1}, LW3/b;->h0(Z)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :try_start_0
    iget-boolean p1, p0, LW3/b;->v:Z

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1}, Lcom/zte/mifavor/widget/u;->u(Landroid/view/Window;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const/4 p1, 0x0

    .line 72
    invoke-virtual {p0, p1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0, v0}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :catch_0
    move-exception p0

    .line 85
    const-string p1, "BS#BaseSinkActivity"

    .line 86
    .line 87
    const-string v0, "set Navigation Bar Contrast Enforced.e="

    .line 88
    .line 89
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/appcompat/app/c;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, LW3/b;->o:Lcom/zte/mifavor/widget/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/a;->j()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onMultiWindowModeChanged(ZLandroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/activity/h;->onMultiWindowModeChanged(ZLandroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, LW3/b;->K()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/s;->onPause()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, LW3/b;->j0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/s;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LW3/b;->V()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    iput-object v0, p0, LW3/b;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, LW3/b;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, LW3/b;->e0()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method protected onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/appcompat/app/c;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lb4/g;->e(Landroid/content/Context;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, LW3/b;->X()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroidx/appcompat/app/c;->onStop()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :try_start_0
    iget-object v1, p0, LW3/b;->r:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, LW3/b$k;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_2

    .line 18
    :catch_0
    move-exception v1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    move-object v1, v0

    .line 21
    :goto_0
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    :cond_1
    iput-object v0, p0, LW3/b;->r:Ljava/lang/ref/WeakReference;

    .line 35
    .line 36
    return-void

    .line 37
    :goto_1
    :try_start_1
    const-string v2, "BS#BaseSinkActivity"

    .line 38
    .line 39
    const-string v3, "unregisterContentObserver error.e="

    .line 40
    .line 41
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, LW3/b;->r:Ljava/lang/ref/WeakReference;

    .line 45
    .line 46
    return-void

    .line 47
    :goto_2
    iput-object v0, p0, LW3/b;->r:Ljava/lang/ref/WeakReference;

    .line 48
    .line 49
    throw v1
.end method
