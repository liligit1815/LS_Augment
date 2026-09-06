.class public abstract Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;,
        Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;,
        Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$r;,
        Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;,
        Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$u;,
        Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$s;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<B:",
        "Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar<",
        "TB;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final s:Landroid/os/Handler;

.field private static final t:Z

.field private static final u:[I

.field private static final v:Ljava/lang/String;


# instance fields
.field private final a:Landroid/view/ViewGroup;

.field private final b:Landroid/content/Context;

.field protected final c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

.field private final d:Lcom/android/launcher3/mfvUtil/customsnackbar/a;

.field private e:I

.field private f:Z

.field private g:Landroid/view/View;

.field private final h:Ljava/lang/Runnable;

.field private i:Landroid/graphics/Rect;

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$r<",
            "TB;>;>;"
        }
    .end annotation
.end field

.field private p:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;

.field private final q:Landroid/view/accessibility/AccessibilityManager;

.field r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->t:Z

    .line 3
    .line 4
    const v0, 0x7f040602

    .line 5
    .line 6
    .line 7
    filled-new-array {v0}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->u:[I

    .line 12
    .line 13
    const-class v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->v:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v0, Landroid/os/Handler;

    .line 22
    .line 23
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$i;

    .line 28
    .line 29
    invoke-direct {v2}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$i;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->s:Landroid/os/Handler;

    .line 36
    .line 37
    return-void
.end method

.method protected constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;Lcom/android/launcher3/mfvUtil/customsnackbar/a;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$j;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->h:Ljava/lang/Runnable;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$m;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$m;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 17
    .line 18
    if-eqz p1, :cond_4

    .line 19
    .line 20
    if-eqz p2, :cond_3

    .line 21
    .line 22
    if-eqz p3, :cond_2

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->a:Landroid/view/ViewGroup;

    .line 25
    .line 26
    iput-object p3, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->d:Lcom/android/launcher3/mfvUtil/customsnackbar/a;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    iput-object p3, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->b:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {p3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->A()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 50
    .line 51
    instance-of v0, p2, Lcom/android/launcher3/mfvUtil/customsnackbar/SnackbarContentLayout;

    .line 52
    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    move-object v0, p2

    .line 56
    check-cast v0, Lcom/android/launcher3/mfvUtil/customsnackbar/SnackbarContentLayout;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->getActionTextColorAlpha()F

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {v0, v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/SnackbarContentLayout;->c(F)V

    .line 63
    .line 64
    .line 65
    :cond_0
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    instance-of v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 73
    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 77
    .line 78
    new-instance v0, Landroid/graphics/Rect;

    .line 79
    .line 80
    iget v1, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 81
    .line 82
    iget v2, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 83
    .line 84
    iget v3, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 85
    .line 86
    iget p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 87
    .line 88
    invoke-direct {v0, v1, v2, v3, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->i:Landroid/graphics/Rect;

    .line 92
    .line 93
    :cond_1
    const/4 p2, 0x1

    .line 94
    invoke-static {p1, p2}, LJ/I;->l0(Landroid/view/View;I)V

    .line 95
    .line 96
    .line 97
    invoke-static {p1, p2}, LJ/I;->t0(Landroid/view/View;I)V

    .line 98
    .line 99
    .line 100
    invoke-static {p1, p2}, LJ/I;->s0(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    new-instance p2, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$k;

    .line 104
    .line 105
    invoke-direct {p2, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$k;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, p2}, LJ/I;->y0(Landroid/view/View;LJ/x;)V

    .line 109
    .line 110
    .line 111
    new-instance p2, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$l;

    .line 112
    .line 113
    invoke-direct {p2, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$l;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 114
    .line 115
    .line 116
    invoke-static {p1, p2}, LJ/I;->j0(Landroid/view/View;LJ/a;)V

    .line 117
    .line 118
    .line 119
    const-string p1, "accessibility"

    .line 120
    .line 121
    invoke-virtual {p3, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    check-cast p1, Landroid/view/accessibility/AccessibilityManager;

    .line 126
    .line 127
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->q:Landroid/view/accessibility/AccessibilityManager;

    .line 128
    .line 129
    return-void

    .line 130
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 131
    .line 132
    const-string p1, "Transient bottom bar must have non-null callback"

    .line 133
    .line 134
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw p0

    .line 138
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 139
    .line 140
    const-string p1, "Transient bottom bar must have non-null content"

    .line 141
    .line 142
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    throw p0

    .line 146
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 147
    .line 148
    const-string p1, "Transient bottom bar must have non-null parent"

    .line 149
    .line 150
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    throw p0
.end method

.method private B()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 18
    .line 19
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 20
    .line 21
    add-int/2addr v0, p0

    .line 22
    :cond_0
    return v0
.end method

.method private D()I
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 5
    .line 6
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    aget v0, v0, v1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    add-int/2addr v0, p0

    .line 19
    return v0
.end method

.method private G()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    instance-of p0, p0, Lcom/google/android/material/behavior/SwipeDismissBehavior;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private L(Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->p:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->x()Lcom/google/android/material/behavior/SwipeDismissBehavior;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    instance-of v1, v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    move-object v1, v0

    .line 14
    check-cast v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;->T(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    new-instance v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$p;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$p;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/google/android/material/behavior/SwipeDismissBehavior;->P(Lcom/google/android/material/behavior/SwipeDismissBehavior$c;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->o(Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->g:Landroid/view/View;

    .line 31
    .line 32
    if-nez p0, :cond_2

    .line 33
    .line 34
    const/16 p0, 0x50

    .line 35
    .line 36
    iput p0, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->g:I

    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method private N()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->m:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->f:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->G()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private Q()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->M()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->p()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->I()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private R()V
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->u([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-array v2, v0, [F

    .line 12
    .line 13
    fill-array-data v2, :array_1

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v2}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->y([F)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 23
    .line 24
    .line 25
    new-array v0, v0, [Landroid/animation/Animator;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    aput-object v1, v0, v4

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    aput-object v2, v0, v1

    .line 32
    .line 33
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 34
    .line 35
    .line 36
    const-wide/16 v0, 0x96

    .line 37
    .line 38
    invoke-virtual {v3, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 39
    .line 40
    .line 41
    new-instance v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$a;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$a;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    :array_1
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private S(I)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->u([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-wide/16 v1, 0x4b

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$b;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$b;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    nop

    .line 29
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private T()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->B()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-boolean v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->t:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 10
    .line 11
    invoke-static {v1, v0}, LJ/I;->U(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 16
    .line 17
    int-to-float v2, v0

    .line 18
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 19
    .line 20
    .line 21
    :goto_0
    new-instance v1, Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    invoke-direct {v1}, Landroid/animation/ValueAnimator;-><init>()V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    filled-new-array {v0, v2}, [I

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 32
    .line 33
    .line 34
    sget-object v2, LY2/a;->b:Landroid/animation/TimeInterpolator;

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 37
    .line 38
    .line 39
    const-wide/16 v2, 0xfa

    .line 40
    .line 41
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    .line 44
    new-instance v2, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$e;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$e;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 50
    .line 51
    .line 52
    new-instance v2, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;

    .line 53
    .line 54
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$f;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method private U(I)V
    .locals 3

    .line 1
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->B()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    filled-new-array {v1, v2}, [I

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 16
    .line 17
    .line 18
    sget-object v1, LY2/a;->b:Landroid/animation/TimeInterpolator;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 21
    .line 22
    .line 23
    const-wide/16 v1, 0xfa

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    .line 28
    new-instance v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$g;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$g;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$h;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$h;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private V()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    if-eqz v1, :cond_4

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->i:Landroid/graphics/Rect;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->b:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const v2, 0x7f070a76

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    new-instance v2, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    iget-boolean v4, v2, Lcom/android/launcher3/h0;->P0:Z

    .line 55
    .line 56
    if-nez v4, :cond_1

    .line 57
    .line 58
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 59
    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    iget v2, v2, Lcom/android/launcher3/r4;->R:I

    .line 63
    .line 64
    iput v2, v3, Landroid/graphics/Rect;->bottom:I

    .line 65
    .line 66
    :cond_1
    move-object v2, v3

    .line 67
    :cond_2
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    add-int/2addr v1, v2

    .line 70
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->i:Landroid/graphics/Rect;

    .line 73
    .line 74
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 75
    .line 76
    iget v3, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->k:I

    .line 77
    .line 78
    add-int/2addr v2, v3

    .line 79
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 80
    .line 81
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 82
    .line 83
    iget v2, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->l:I

    .line 84
    .line 85
    add-int/2addr v1, v2

    .line 86
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->N()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 100
    .line 101
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->h:Ljava/lang/Runnable;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->h:Ljava/lang/Runnable;

    .line 109
    .line 110
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 111
    .line 112
    .line 113
    :cond_3
    return-void

    .line 114
    :cond_4
    :goto_0
    sget-object p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->v:Ljava/lang/String;

    .line 115
    .line 116
    const-string v0, "Unable to update margins because layout params are not MarginLayoutParams"

    .line 117
    .line 118
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)Lcom/android/launcher3/mfvUtil/customsnackbar/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->d:Lcom/android/launcher3/mfvUtil/customsnackbar/a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->m:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->m:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->j:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->k:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic g(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->l:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->z()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->D()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->Q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic l(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic m(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic n()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic o()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->t:Z

    .line 2
    .line 3
    return v0
.end method

.method private q(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->getAnimationMode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->S(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->U(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private r()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->g:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v1, 0x2

    .line 8
    new-array v2, v1, [I

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aget v2, v2, v0

    .line 15
    .line 16
    new-array v1, v1, [I

    .line 17
    .line 18
    iget-object v3, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->a:Landroid/view/ViewGroup;

    .line 19
    .line 20
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 21
    .line 22
    .line 23
    aget v0, v1, v0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->a:Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    add-int/2addr v0, p0

    .line 32
    sub-int/2addr v0, v2

    .line 33
    return v0
.end method

.method private varargs u([F)Landroid/animation/ValueAnimator;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, LY2/a;->a:Landroid/animation/TimeInterpolator;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$c;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$c;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method private varargs y([F)Landroid/animation/ValueAnimator;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, LY2/a;->d:Landroid/animation/TimeInterpolator;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$d;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$d;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method private z()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "window"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/view/WindowManager;

    .line 10
    .line 11
    new-instance v0, Landroid/util/DisplayMetrics;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 21
    .line 22
    .line 23
    iget p0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 24
    .line 25
    return p0
.end method


# virtual methods
.method protected A()I
    .locals 0

    .line 1
    const p0, 0x7f0e0094

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public C()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    return-object p0
.end method

.method final E(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->M()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->q(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->H(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public F()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->c()Lcom/android/launcher3/mfvUtil/customsnackbar/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->e(Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method H(I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->c()Lcom/android/launcher3/mfvUtil/customsnackbar/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->h(Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->o:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    :goto_0
    if-ltz v0, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->o:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$r;

    .line 29
    .line 30
    invoke-virtual {v1, p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$r;->a(Ljava/lang/Object;I)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v0, v0, -0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    check-cast p1, Landroid/view/ViewGroup;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method I()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->c()Lcom/android/launcher3/mfvUtil/customsnackbar/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->i(Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->o:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    :goto_0
    if-ltz v0, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->o:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$r;

    .line 29
    .line 30
    invoke-virtual {v1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$r;->b(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v0, v0, -0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void
.end method

.method public J(I)Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->setAnimationMode(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public K(I)Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TB;"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method M()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->q:Landroid/view/accessibility/AccessibilityManager;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityManager;->getEnabledAccessibilityServiceList(I)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public O()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->c()Lcom/android/launcher3/mfvUtil/customsnackbar/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->w()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->m(ILcom/android/launcher3/mfvUtil/customsnackbar/b$b;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method final P()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$n;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->setOnAttachStateChangeListener(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 30
    .line 31
    invoke-direct {p0, v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->L(Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->n:I

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->V()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 44
    .line 45
    const/4 v1, 0x4

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->a:Landroid/view/ViewGroup;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 57
    .line 58
    invoke-static {v0}, LJ/I;->O(Landroid/view/View;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->Q()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 69
    .line 70
    new-instance v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$o;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$o;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->setOnLayoutChangeListener(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$u;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$q;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$q;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->t(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method protected t(I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->c()Lcom/android/launcher3/mfvUtil/customsnackbar/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->r:Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/b;->b(Lcom/android/launcher3/mfvUtil/customsnackbar/b$b;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public v()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->e:I

    .line 2
    .line 3
    return p0
.end method

.method protected x()Lcom/google/android/material/behavior/SwipeDismissBehavior;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/material/behavior/SwipeDismissBehavior<",
            "+",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$Behavior;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
