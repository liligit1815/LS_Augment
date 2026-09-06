.class public Landroidx/slice/widget/m;
.super Landroid/view/ViewGroup;
.source "SliceView.java"

# interfaces
.implements LW/i;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/m$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/view/ViewGroup;",
        "LW/i<",
        "Landroidx/slice/Slice;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# static fields
.field public static final J:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lh0/d;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:I

.field private B:Landroid/view/View$OnClickListener;

.field private C:I

.field private D:I

.field E:Z

.field F:Z

.field G:[I

.field H:Ljava/lang/Runnable;

.field I:Ljava/lang/Runnable;

.field g:Landroidx/slice/widget/d;

.field h:Landroidx/slice/widget/h;

.field i:Landroid/view/View$OnLongClickListener;

.field j:Landroid/os/Handler;

.field k:Lf0/a;

.field private l:Landroidx/slice/Slice;

.field private m:Landroidx/slice/widget/j;

.field private n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lh0/d;",
            ">;"
        }
    .end annotation
.end field

.field private o:Landroidx/slice/widget/a;

.field private p:Z

.field private q:Z

.field private r:Z

.field private s:Z

.field private t:Z

.field private u:Z

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/slice/widget/m$a;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/slice/widget/m$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/slice/widget/m;->J:Ljava/util/Comparator;

    .line 7
    .line 8
    return-void
.end method

.method private b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/slice/widget/d;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/slice/widget/m;->getMode()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    throw p0

    .line 22
    :cond_0
    throw p0

    .line 23
    :cond_1
    return-void
.end method

.method private c(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x3

    .line 15
    if-eq v0, p1, :cond_2

    .line 16
    .line 17
    return v2

    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    float-to-int v0, v0

    .line 23
    iget v1, p0, Landroidx/slice/widget/m;->C:I

    .line 24
    .line 25
    sub-int/2addr v0, v1

    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    float-to-int p1, p1

    .line 31
    iget v1, p0, Landroidx/slice/widget/m;->D:I

    .line 32
    .line 33
    sub-int/2addr p1, v1

    .line 34
    mul-int/2addr v0, v0

    .line 35
    mul-int/2addr p1, p1

    .line 36
    add-int/2addr v0, p1

    .line 37
    iget p1, p0, Landroidx/slice/widget/m;->A:I

    .line 38
    .line 39
    if-le v0, p1, :cond_1

    .line 40
    .line 41
    iput-boolean v2, p0, Landroidx/slice/widget/m;->E:Z

    .line 42
    .line 43
    iget-object p1, p0, Landroidx/slice/widget/m;->j:Landroid/os/Handler;

    .line 44
    .line 45
    iget-object v0, p0, Landroidx/slice/widget/m;->H:Ljava/lang/Runnable;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-boolean p0, p0, Landroidx/slice/widget/m;->F:Z

    .line 51
    .line 52
    return p0

    .line 53
    :cond_2
    iget-boolean p1, p0, Landroidx/slice/widget/m;->F:Z

    .line 54
    .line 55
    iput-boolean v2, p0, Landroidx/slice/widget/m;->E:Z

    .line 56
    .line 57
    iput-boolean v2, p0, Landroidx/slice/widget/m;->F:Z

    .line 58
    .line 59
    iget-object v0, p0, Landroidx/slice/widget/m;->j:Landroid/os/Handler;

    .line 60
    .line 61
    iget-object p0, p0, Landroidx/slice/widget/m;->H:Ljava/lang/Runnable;

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    return p1

    .line 67
    :cond_3
    iget-object v0, p0, Landroidx/slice/widget/m;->j:Landroid/os/Handler;

    .line 68
    .line 69
    iget-object v3, p0, Landroidx/slice/widget/m;->H:Ljava/lang/Runnable;

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    float-to-int v0, v0

    .line 79
    iput v0, p0, Landroidx/slice/widget/m;->C:I

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    float-to-int p1, p1

    .line 86
    iput p1, p0, Landroidx/slice/widget/m;->D:I

    .line 87
    .line 88
    iput-boolean v1, p0, Landroidx/slice/widget/m;->E:Z

    .line 89
    .line 90
    iput-boolean v2, p0, Landroidx/slice/widget/m;->F:Z

    .line 91
    .line 92
    iget-object p1, p0, Landroidx/slice/widget/m;->j:Landroid/os/Handler;

    .line 93
    .line 94
    iget-object p0, p0, Landroidx/slice/widget/m;->H:Ljava/lang/Runnable;

    .line 95
    .line 96
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    int-to-long v0, v0

    .line 101
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 102
    .line 103
    .line 104
    return v2
.end method

.method private d(Landroidx/slice/Slice;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-virtual {p1}, Landroidx/slice/Slice;->e()Landroid/net/Uri;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-object v1, p0, Landroidx/slice/widget/m;->l:Landroidx/slice/Slice;

    .line 12
    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    invoke-virtual {v1}, Landroidx/slice/Slice;->e()Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p1}, Landroidx/slice/Slice;->e()Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-void

    .line 31
    :cond_2
    :goto_0
    invoke-direct {p0, v0}, Landroidx/slice/widget/m;->e(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1}, Landroidx/slice/Slice;->e()Landroid/net/Uri;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {v0, p1}, Landroidx/slice/widget/j;->a(Landroid/content/Context;Landroid/net/Uri;)Landroidx/slice/widget/j;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Landroidx/slice/widget/m;->m:Landroidx/slice/widget/j;

    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    :goto_1
    invoke-direct {p0, v0}, Landroidx/slice/widget/m;->e(Z)V

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Landroidx/slice/widget/m;->m:Landroidx/slice/widget/j;

    .line 54
    .line 55
    return-void
.end method

.method private e(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/m;->m:Landroidx/slice/widget/j;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean v1, p0, Landroidx/slice/widget/m;->r:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/slice/widget/j;->c()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Landroidx/slice/widget/m;->r:Z

    .line 16
    .line 17
    :cond_0
    if-nez p1, :cond_1

    .line 18
    .line 19
    iget-boolean p1, p0, Landroidx/slice/widget/m;->r:Z

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Landroidx/slice/widget/m;->m:Landroidx/slice/widget/j;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroidx/slice/widget/j;->b()V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Landroidx/slice/widget/m;->r:Z

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public static f(I)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "unknown mode: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    const-string p0, "MODE SHORTCUT"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    const-string p0, "MODE LARGE"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    const-string p0, "MODE SMALL"

    .line 35
    .line 36
    return-object p0
.end method

.method private getTintColor()I
    .locals 3

    .line 1
    iget v0, p0, Landroidx/slice/widget/m;->z:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/m;->l:Landroidx/slice/Slice;

    .line 8
    .line 9
    const-string v1, "int"

    .line 10
    .line 11
    const-string v2, "color"

    .line 12
    .line 13
    invoke-static {v0, v1, v2}, Lh0/f;->m(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->j()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Landroidx/slice/widget/o;->b(Landroid/content/Context;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method private h(Z)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Landroidx/slice/widget/m;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {v0}, Lf0/a;->j()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Landroidx/slice/widget/m;->j:Landroid/os/Handler;

    .line 18
    .line 19
    iget-object v0, p0, Landroidx/slice/widget/m;->I:Ljava/lang/Runnable;

    .line 20
    .line 21
    iget-object v1, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 22
    .line 23
    invoke-virtual {v1}, Lf0/a;->h()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const-wide/32 v2, 0xea60

    .line 28
    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object p0, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 34
    .line 35
    invoke-virtual {p0}, Lf0/a;->g()J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    add-long/2addr v2, v4

    .line 40
    :goto_0
    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p1, p0, Landroidx/slice/widget/m;->j:Landroid/os/Handler;

    .line 45
    .line 46
    iget-object p0, p0, Landroidx/slice/widget/m;->I:Ljava/lang/Runnable;

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method private m()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/m;->n:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0x8

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/slice/widget/h;->setSliceActions(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-virtual {v0, v1, v2, v3, p0}, Landroidx/slice/widget/h;->b(IIII)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 41
    .line 42
    iget-object v3, p0, Landroidx/slice/widget/m;->n:Ljava/util/List;

    .line 43
    .line 44
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 45
    .line 46
    .line 47
    sget-object v3, Landroidx/slice/widget/m;->J:Ljava/util/Comparator;

    .line 48
    .line 49
    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 50
    .line 51
    .line 52
    iget-boolean v3, p0, Landroidx/slice/widget/m;->p:Z

    .line 53
    .line 54
    if-eqz v3, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0}, Landroidx/slice/widget/m;->getMode()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    const/4 v4, 0x3

    .line 61
    if-eq v3, v4, :cond_1

    .line 62
    .line 63
    iget-object v3, p0, Landroidx/slice/widget/m;->n:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    const/4 v4, 0x2

    .line 70
    if-lt v3, v4, :cond_1

    .line 71
    .line 72
    iget-object v2, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 73
    .line 74
    invoke-direct {p0}, Landroidx/slice/widget/m;->getTintColor()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-virtual {v2, v0, v3}, Landroidx/slice/widget/a;->g(Ljava/util/List;I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 82
    .line 83
    const/4 v2, 0x0

    .line 84
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroidx/slice/widget/h;->setSliceActions(Ljava/util/List;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    invoke-virtual {v0, v1, v3, v4, v2}, Landroidx/slice/widget/h;->b(IIII)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/widget/FrameLayout;->setPaddingRelative(IIII)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_1
    iget-object v1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 128
    .line 129
    invoke-virtual {v1, v0}, Landroidx/slice/widget/h;->setSliceActions(Ljava/util/List;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 147
    .line 148
    .line 149
    move-result v5

    .line 150
    invoke-virtual {v0, v1, v3, v4, v5}, Landroidx/slice/widget/h;->b(IIII)V

    .line 151
    .line 152
    .line 153
    iget-object p0, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 154
    .line 155
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 156
    .line 157
    .line 158
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroidx/slice/Slice;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/slice/widget/m;->g(Landroidx/slice/Slice;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Landroidx/slice/Slice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/slice/widget/m;->setSlice(Landroidx/slice/Slice;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getMode()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public getSlice()Landroidx/slice/Slice;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/m;->l:Landroidx/slice/Slice;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSliceActions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lh0/d;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/m;->n:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object p0, p0, Landroidx/slice/widget/m;->n:Ljava/util/List;

    .line 14
    .line 15
    return-object p0
.end method

.method public i(IZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string p0, "SliceView"

    .line 4
    .line 5
    const-string p1, "Animation not supported yet"

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    throw p0
.end method

.method public j(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroidx/slice/widget/m;->setShowActionDividers(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroidx/slice/widget/m;->setShowHeaderDivider(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroidx/slice/widget/m;->setShowTitleItems(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isShown()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-direct {p0, v0}, Landroidx/slice/widget/m;->e(Z)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v0}, Landroidx/slice/widget/m;->h(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Landroidx/slice/widget/d;->d(Landroid/content/Context;)Lh0/d;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    :try_start_0
    iget-object p1, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Landroidx/slice/widget/d;->d(Landroid/content/Context;)Lh0/d;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lh0/e;

    .line 26
    .line 27
    invoke-virtual {p1}, Lh0/e;->d()Landroidx/slice/SliceItem;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-virtual {v0, v1, v2}, Landroidx/slice/SliceItem;->d(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    iget-object p0, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 45
    .line 46
    invoke-virtual {p1}, Lh0/e;->e()Landroidx/slice/SliceItem;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Landroidx/slice/widget/h;->setActionLoading(Landroidx/slice/SliceItem;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void

    .line 54
    :catch_0
    move-exception p0

    .line 55
    const-string p1, "SliceView"

    .line 56
    .line 57
    const-string v0, "PendingIntent for slice cannot be sent"

    .line 58
    .line 59
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iget-object p1, p0, Landroidx/slice/widget/m;->B:Landroid/view/View$OnClickListener;

    .line 64
    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Landroidx/slice/widget/m;->e(Z)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Landroidx/slice/widget/m;->h(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/m;->i:Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Landroidx/slice/widget/m;->c(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_2

    .line 16
    .line 17
    :cond_1
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_2
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    const/4 p4, 0x0

    .line 12
    invoke-virtual {p1, p4, p4, p2, p3}, Landroid/view/View;->layout(IIII)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    const/16 p3, 0x8

    .line 22
    .line 23
    if-eq p2, p3, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object p2, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    iget-object p0, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    add-int/2addr p0, p1

    .line 42
    invoke-virtual {p2, p4, p1, p3, p0}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroidx/slice/widget/m;->getMode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x3

    .line 10
    if-ne v1, v0, :cond_0

    .line 11
    .line 12
    iget p1, p0, Landroidx/slice/widget/m;->v:I

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/2addr p1, v0

    .line 19
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p1, v0

    .line 24
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/16 v2, 0x8

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    if-eq v0, v2, :cond_1

    .line 34
    .line 35
    iget v0, p0, Landroidx/slice/widget/m;->y:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move v0, v3

    .line 39
    :goto_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    if-eqz v4, :cond_2

    .line 52
    .line 53
    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 54
    .line 55
    const/4 v5, -0x2

    .line 56
    if-eq v4, v5, :cond_3

    .line 57
    .line 58
    :cond_2
    if-nez p2, :cond_4

    .line 59
    .line 60
    :cond_3
    const/4 v4, -0x1

    .line 61
    goto :goto_1

    .line 62
    :cond_4
    move v4, v2

    .line 63
    :goto_1
    invoke-direct {p0, v4}, Landroidx/slice/widget/m;->b(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    sub-int/2addr v2, v4

    .line 71
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    sub-int/2addr v2, v4

    .line 76
    const/high16 v4, 0x40000000    # 2.0f

    .line 77
    .line 78
    if-eq p2, v4, :cond_b

    .line 79
    .line 80
    iget-object v5, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 81
    .line 82
    if-eqz v5, :cond_a

    .line 83
    .line 84
    invoke-virtual {v5}, Landroidx/slice/widget/d;->g()Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-nez v5, :cond_5

    .line 89
    .line 90
    goto :goto_4

    .line 91
    :cond_5
    invoke-virtual {p0}, Landroidx/slice/widget/m;->getMode()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-ne v5, v1, :cond_6

    .line 96
    .line 97
    iget p2, p0, Landroidx/slice/widget/m;->v:I

    .line 98
    .line 99
    :goto_2
    add-int v2, p2, v0

    .line 100
    .line 101
    goto :goto_5

    .line 102
    :cond_6
    iget-object v1, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 103
    .line 104
    const/4 v5, 0x0

    .line 105
    invoke-virtual {v1, v5, v5}, Landroidx/slice/widget/d;->l(Landroidx/slice/widget/l;Landroidx/slice/widget/n;)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    add-int/2addr v1, v0

    .line 110
    if-gt v2, v1, :cond_9

    .line 111
    .line 112
    if-nez p2, :cond_7

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_7
    invoke-virtual {p0}, Landroidx/slice/widget/m;->getMode()I

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    const/4 v1, 0x2

    .line 120
    if-ne p2, v1, :cond_8

    .line 121
    .line 122
    iget p2, p0, Landroidx/slice/widget/m;->x:I

    .line 123
    .line 124
    add-int v1, p2, v0

    .line 125
    .line 126
    if-lt v2, v1, :cond_8

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_8
    iget p2, p0, Landroidx/slice/widget/m;->w:I

    .line 130
    .line 131
    if-gt v2, p2, :cond_b

    .line 132
    .line 133
    move v2, p2

    .line 134
    goto :goto_5

    .line 135
    :cond_9
    :goto_3
    move v2, v1

    .line 136
    goto :goto_5

    .line 137
    :cond_a
    :goto_4
    move v2, v0

    .line 138
    :cond_b
    :goto_5
    invoke-static {p1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    if-lez v0, :cond_c

    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    add-int/2addr v1, v0

    .line 149
    goto :goto_6

    .line 150
    :cond_c
    move v1, v3

    .line 151
    :goto_6
    iget-object v5, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 152
    .line 153
    invoke-static {v1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    invoke-virtual {v5, p2, v1}, Landroid/widget/FrameLayout;->measure(II)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    add-int/2addr v2, v1

    .line 165
    if-lez v0, :cond_d

    .line 166
    .line 167
    goto :goto_7

    .line 168
    :cond_d
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    :goto_7
    add-int/2addr v2, v3

    .line 173
    iget-object v0, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 174
    .line 175
    invoke-static {v2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    invoke-virtual {v0, p2, v1}, Landroid/widget/FrameLayout;->measure(II)V

    .line 180
    .line 181
    .line 182
    iget-object p2, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 183
    .line 184
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    iget-object v0, p0, Landroidx/slice/widget/m;->o:Landroidx/slice/widget/a;

    .line 189
    .line 190
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    add-int/2addr p2, v0

    .line 195
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/m;->i:Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Landroidx/slice/widget/m;->c(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_2

    .line 16
    .line 17
    :cond_1
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_2
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onVisibilityChanged(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v0, 0x1

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    move v1, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v1, p1

    .line 17
    :goto_0
    invoke-direct {p0, v1}, Landroidx/slice/widget/m;->e(Z)V

    .line 18
    .line 19
    .line 20
    if-nez p2, :cond_1

    .line 21
    .line 22
    move p1, v0

    .line 23
    :cond_1
    invoke-direct {p0, p1}, Landroidx/slice/widget/m;->h(Z)V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onWindowVisibilityChanged(I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    move v2, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, v0

    .line 11
    :goto_0
    invoke-direct {p0, v2}, Landroidx/slice/widget/m;->e(Z)V

    .line 12
    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    move v0, v1

    .line 17
    :cond_1
    invoke-direct {p0, v0}, Landroidx/slice/widget/m;->h(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setAccentColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/slice/widget/m;->z:I

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    throw p0
.end method

.method public setClickInfo([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/m;->G:[I

    .line 2
    .line 3
    return-void
.end method

.method public setMode(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Landroidx/slice/widget/m;->i(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/m;->B:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/slice/widget/m;->i:Landroid/view/View$OnLongClickListener;

    .line 5
    .line 6
    return-void
.end method

.method public setOnSliceActionListener(Landroidx/slice/widget/m$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroidx/slice/widget/h;->setSliceActionListener(Landroidx/slice/widget/m$b;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setScrollable(Z)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public setShowActionDividers(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/m;->u:Z

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/slice/widget/d;->r(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setShowActionRow(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/m;->p:Z

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/slice/widget/m;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setShowHeaderDivider(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/m;->t:Z

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/slice/widget/d;->s(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setShowTitleItems(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/m;->s:Z

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/slice/widget/d;->t(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setSlice(Landroidx/slice/Slice;)V
    .locals 6

    .line 1
    invoke-static {p0}, Landroidx/slice/widget/e;->b(Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Landroidx/slice/widget/e;->a(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Landroidx/slice/widget/m;->d(Landroidx/slice/Slice;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Landroidx/slice/widget/m;->l:Landroidx/slice/Slice;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/slice/Slice;->e()Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Landroidx/slice/widget/m;->l:Landroidx/slice/Slice;

    .line 23
    .line 24
    invoke-virtual {v3}, Landroidx/slice/Slice;->e()Landroid/net/Uri;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v2, v3}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    move v2, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v2, v0

    .line 37
    :goto_0
    iget-object v3, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 38
    .line 39
    iput-object p1, p0, Landroidx/slice/widget/m;->l:Landroidx/slice/Slice;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object v5, p0, Landroidx/slice/widget/m;->l:Landroidx/slice/Slice;

    .line 49
    .line 50
    invoke-static {p1, v5}, Lf0/a;->a(Landroid/content/Context;Landroidx/slice/Slice;)Lf0/a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    move-object p1, v4

    .line 56
    :goto_1
    iput-object p1, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 57
    .line 58
    const/4 v5, 0x2

    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    invoke-virtual {v3}, Lf0/a;->d()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-ne v2, v5, :cond_3

    .line 66
    .line 67
    invoke-virtual {p1}, Lf0/a;->d()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 75
    .line 76
    invoke-virtual {p1}, Landroidx/slice/widget/h;->a()V

    .line 77
    .line 78
    .line 79
    :cond_3
    iget-object p1, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 80
    .line 81
    if-eqz p1, :cond_4

    .line 82
    .line 83
    invoke-virtual {p1}, Lf0/a;->c()Landroidx/slice/widget/d;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    goto :goto_2

    .line 88
    :cond_4
    move-object p1, v4

    .line 89
    :goto_2
    iput-object p1, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 90
    .line 91
    iget-boolean p1, p0, Landroidx/slice/widget/m;->s:Z

    .line 92
    .line 93
    if-eqz p1, :cond_5

    .line 94
    .line 95
    invoke-virtual {p0, v1}, Landroidx/slice/widget/m;->l(Z)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-boolean p1, p0, Landroidx/slice/widget/m;->t:Z

    .line 99
    .line 100
    if-eqz p1, :cond_6

    .line 101
    .line 102
    invoke-virtual {p0, v1}, Landroidx/slice/widget/m;->k(Z)V

    .line 103
    .line 104
    .line 105
    :cond_6
    iget-boolean p1, p0, Landroidx/slice/widget/m;->u:Z

    .line 106
    .line 107
    if-eqz p1, :cond_7

    .line 108
    .line 109
    invoke-virtual {p0, v1}, Landroidx/slice/widget/m;->j(Z)V

    .line 110
    .line 111
    .line 112
    :cond_7
    iget-object p1, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 113
    .line 114
    if-eqz p1, :cond_b

    .line 115
    .line 116
    invoke-virtual {p1}, Landroidx/slice/widget/d;->g()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_8

    .line 121
    .line 122
    goto :goto_4

    .line 123
    :cond_8
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 124
    .line 125
    invoke-virtual {p1, v4}, Landroidx/slice/widget/h;->setLoadingActions(Ljava/util/Set;)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 129
    .line 130
    invoke-virtual {p1}, Lf0/a;->e()Ljava/util/List;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iput-object p1, p0, Landroidx/slice/widget/m;->n:Ljava/util/List;

    .line 135
    .line 136
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 137
    .line 138
    iget-object v2, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 139
    .line 140
    invoke-virtual {v2}, Lf0/a;->b()J

    .line 141
    .line 142
    .line 143
    move-result-wide v2

    .line 144
    invoke-virtual {p1, v2, v3}, Landroidx/slice/widget/h;->setLastUpdated(J)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 148
    .line 149
    iget-boolean v2, p0, Landroidx/slice/widget/m;->q:Z

    .line 150
    .line 151
    if-eqz v2, :cond_9

    .line 152
    .line 153
    iget-object v2, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 154
    .line 155
    invoke-virtual {v2}, Lf0/a;->h()Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-eqz v2, :cond_9

    .line 160
    .line 161
    move v0, v1

    .line 162
    :cond_9
    invoke-virtual {p1, v0}, Landroidx/slice/widget/h;->setShowLastUpdated(Z)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 166
    .line 167
    iget-object v0, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 168
    .line 169
    invoke-virtual {v0}, Lf0/a;->i()Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    invoke-virtual {p1, v0}, Landroidx/slice/widget/h;->setAllowTwoLines(Z)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 177
    .line 178
    invoke-direct {p0}, Landroidx/slice/widget/m;->getTintColor()I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    invoke-virtual {p1, v0}, Landroidx/slice/widget/h;->setTint(I)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 186
    .line 187
    invoke-virtual {p1}, Landroidx/slice/widget/i;->c()I

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    const/4 v0, -0x1

    .line 192
    if-eq p1, v0, :cond_a

    .line 193
    .line 194
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 195
    .line 196
    iget-object v0, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 197
    .line 198
    invoke-virtual {v0}, Landroidx/slice/widget/i;->c()I

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 203
    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_a
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 207
    .line 208
    invoke-virtual {p1, v5}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 209
    .line 210
    .line 211
    :goto_3
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 212
    .line 213
    iget-object v0, p0, Landroidx/slice/widget/m;->g:Landroidx/slice/widget/d;

    .line 214
    .line 215
    invoke-virtual {p1, v0}, Landroidx/slice/widget/h;->setSliceContent(Landroidx/slice/widget/d;)V

    .line 216
    .line 217
    .line 218
    invoke-direct {p0}, Landroidx/slice/widget/m;->m()V

    .line 219
    .line 220
    .line 221
    invoke-direct {p0, v1}, Landroidx/slice/widget/m;->e(Z)V

    .line 222
    .line 223
    .line 224
    invoke-direct {p0, v1}, Landroidx/slice/widget/m;->h(Z)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_b
    :goto_4
    iput-object v4, p0, Landroidx/slice/widget/m;->n:Ljava/util/List;

    .line 229
    .line 230
    iget-object p1, p0, Landroidx/slice/widget/m;->h:Landroidx/slice/widget/h;

    .line 231
    .line 232
    invoke-virtual {p1}, Landroidx/slice/widget/h;->a()V

    .line 233
    .line 234
    .line 235
    invoke-direct {p0}, Landroidx/slice/widget/m;->m()V

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method public setSliceActions(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lh0/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/m;->l:Landroidx/slice/Slice;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/slice/widget/m;->k:Lf0/a;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-virtual {v0}, Lf0/a;->e()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ge v1, v2, :cond_1

    .line 23
    .line 24
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v2, "Trying to set an action that isn\'t available: "

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw p0

    .line 64
    :cond_1
    if-nez p1, :cond_2

    .line 65
    .line 66
    new-instance p1, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    :cond_2
    iput-object p1, p0, Landroidx/slice/widget/m;->n:Ljava/util/List;

    .line 72
    .line 73
    invoke-direct {p0}, Landroidx/slice/widget/m;->m()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 78
    .line 79
    const-string p1, "Trying to set actions on a view without a slice"

    .line 80
    .line 81
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    throw p0
.end method

.method setSliceViewPolicy(Landroidx/slice/widget/n;)V
    .locals 0

    .line 1
    return-void
.end method
