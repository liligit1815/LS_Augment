.class public Lcom/android/launcher3/b0;
.super Ljava/lang/Object;
.source "DesktopGrid.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/b0$e;,
        Lcom/android/launcher3/b0$f;
    }
.end annotation


# static fields
.field static final g:Lcom/android/launcher3/b0$e;

.field static final h:Lcom/android/launcher3/b0$e;

.field static final i:Lcom/android/launcher3/b0$e;

.field static final j:Lcom/android/launcher3/b0$e;

.field static final k:Lcom/android/launcher3/b0$e;

.field static final l:Lcom/android/launcher3/b0$e;

.field static final m:Lcom/android/launcher3/b0$e;

.field static final n:Lcom/android/launcher3/b0$e;

.field static final o:Lcom/android/launcher3/b0$e;

.field static final p:Lcom/android/launcher3/b0$e;

.field static final q:Lcom/android/launcher3/b0$e;

.field static r:Lcom/android/launcher3/b0$e;

.field public static s:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/launcher3/b0$e;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;>;"
        }
    .end annotation
.end field

.field private final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private c:Lcom/android/launcher3/util/A0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/util/t0;",
            ">;"
        }
    .end annotation
.end field

.field private d:Z

.field private final e:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/android/launcher3/b0$e;

    .line 2
    .line 3
    const/high16 v1, 0x42680000    # 58.0f

    .line 4
    .line 5
    invoke-direct {v0, v1, v1}, Lcom/android/launcher3/b0$e;-><init>(FF)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/b0;->g:Lcom/android/launcher3/b0$e;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/b0$e;

    .line 11
    .line 12
    const/high16 v1, 0x42900000    # 72.0f

    .line 13
    .line 14
    invoke-direct {v0, v1, v1, v1, v1}, Lcom/android/launcher3/b0$e;-><init>(FFFF)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/b0;->h:Lcom/android/launcher3/b0$e;

    .line 18
    .line 19
    new-instance v0, Lcom/android/launcher3/b0$e;

    .line 20
    .line 21
    const/high16 v1, 0x42600000    # 56.0f

    .line 22
    .line 23
    invoke-direct {v0, v1, v1}, Lcom/android/launcher3/b0$e;-><init>(FF)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/android/launcher3/b0;->i:Lcom/android/launcher3/b0$e;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/b0$e;

    .line 29
    .line 30
    const/high16 v1, 0x42580000    # 54.0f

    .line 31
    .line 32
    invoke-direct {v0, v1, v1}, Lcom/android/launcher3/b0$e;-><init>(FF)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/android/launcher3/b0;->j:Lcom/android/launcher3/b0$e;

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/b0$e;

    .line 38
    .line 39
    const/high16 v2, 0x42400000    # 48.0f

    .line 40
    .line 41
    const/high16 v3, 0x42700000    # 60.0f

    .line 42
    .line 43
    invoke-direct {v0, v1, v1, v2, v3}, Lcom/android/launcher3/b0$e;-><init>(FFFF)V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lcom/android/launcher3/b0;->k:Lcom/android/launcher3/b0$e;

    .line 47
    .line 48
    new-instance v4, Lcom/android/launcher3/b0$e;

    .line 49
    .line 50
    invoke-direct {v4, v1, v1, v2, v3}, Lcom/android/launcher3/b0$e;-><init>(FFFF)V

    .line 51
    .line 52
    .line 53
    sput-object v4, Lcom/android/launcher3/b0;->l:Lcom/android/launcher3/b0$e;

    .line 54
    .line 55
    new-instance v2, Lcom/android/launcher3/b0$e;

    .line 56
    .line 57
    const/high16 v3, 0x42840000    # 66.0f

    .line 58
    .line 59
    invoke-direct {v2, v3, v3}, Lcom/android/launcher3/b0$e;-><init>(FF)V

    .line 60
    .line 61
    .line 62
    sput-object v2, Lcom/android/launcher3/b0;->m:Lcom/android/launcher3/b0$e;

    .line 63
    .line 64
    new-instance v2, Lcom/android/launcher3/b0$e;

    .line 65
    .line 66
    const/high16 v3, 0x428c0000    # 70.0f

    .line 67
    .line 68
    invoke-direct {v2, v3, v3}, Lcom/android/launcher3/b0$e;-><init>(FF)V

    .line 69
    .line 70
    .line 71
    sput-object v2, Lcom/android/launcher3/b0;->n:Lcom/android/launcher3/b0$e;

    .line 72
    .line 73
    new-instance v2, Lcom/android/launcher3/b0$e;

    .line 74
    .line 75
    const/high16 v4, 0x427c0000    # 63.0f

    .line 76
    .line 77
    invoke-direct {v2, v4, v4, v1, v3}, Lcom/android/launcher3/b0$e;-><init>(FFFF)V

    .line 78
    .line 79
    .line 80
    sput-object v2, Lcom/android/launcher3/b0;->o:Lcom/android/launcher3/b0$e;

    .line 81
    .line 82
    new-instance v2, Lcom/android/launcher3/b0$e;

    .line 83
    .line 84
    invoke-direct {v2, v3, v3, v1, v3}, Lcom/android/launcher3/b0$e;-><init>(FFFF)V

    .line 85
    .line 86
    .line 87
    sput-object v2, Lcom/android/launcher3/b0;->p:Lcom/android/launcher3/b0$e;

    .line 88
    .line 89
    new-instance v2, Lcom/android/launcher3/b0$e;

    .line 90
    .line 91
    invoke-direct {v2, v3, v3, v1, v3}, Lcom/android/launcher3/b0$e;-><init>(FFFF)V

    .line 92
    .line 93
    .line 94
    sput-object v2, Lcom/android/launcher3/b0;->q:Lcom/android/launcher3/b0$e;

    .line 95
    .line 96
    sput-object v0, Lcom/android/launcher3/b0;->r:Lcom/android/launcher3/b0$e;

    .line 97
    .line 98
    new-instance v0, Lcom/android/launcher3/b0$a;

    .line 99
    .line 100
    invoke-direct {v0}, Lcom/android/launcher3/b0$a;-><init>()V

    .line 101
    .line 102
    .line 103
    sput-object v0, Lcom/android/launcher3/b0;->s:Ljava/util/HashMap;

    .line 104
    .line 105
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/b0;->d:Z

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/b0$d;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/android/launcher3/b0$d;-><init>(Lcom/android/launcher3/b0;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/b0;->e:Ljava/util/Comparator;

    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/a0;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/android/launcher3/a0;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/b0;->f:Ljava/util/Comparator;

    .line 20
    .line 21
    new-instance v0, Landroid/util/ArrayMap;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 27
    .line 28
    new-instance v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/b0;->b:Ljava/util/ArrayList;

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/util/A0;

    .line 36
    .line 37
    invoke-direct {v0}, Lcom/android/launcher3/util/A0;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/launcher3/b0;->c:Lcom/android/launcher3/util/A0;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/y;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 2
    .line 3
    iget v1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    if-gez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    if-lez v0, :cond_1

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_1
    iget v0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 13
    .line 14
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 15
    .line 16
    sub-int/2addr v0, v1

    .line 17
    if-gez v0, :cond_2

    .line 18
    .line 19
    :goto_0
    const/4 p0, -0x1

    .line 20
    return p0

    .line 21
    :cond_2
    if-lez v0, :cond_3

    .line 22
    .line 23
    :goto_1
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_3
    iget p0, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 26
    .line 27
    iget p1, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 28
    .line 29
    sub-int/2addr p0, p1

    .line 30
    return p0
.end method

.method private f(Landroid/content/Context;II)Z
    .locals 9

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/b0;->q(Landroid/content/Context;II)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {p0, v2, p1, p2, p3}, Lcom/android/launcher3/b0;->r(Lcom/android/launcher3/F1;Landroid/content/Context;II)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "DesktopGrid"

    .line 24
    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Lcom/android/launcher3/C2;->B4(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const/4 p3, 0x0

    .line 35
    invoke-virtual {p2, p3}, Lcom/android/launcher3/H5;->f1(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Lcom/android/launcher3/b0;->t(Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/menu/c;->t()V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lx1/O;->z5()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_0

    .line 53
    .line 54
    const/4 p0, 0x2

    .line 55
    const-wide/16 p2, 0xbb8

    .line 56
    .line 57
    const-string v0, "com.zte.mifavor.launcher"

    .line 58
    .line 59
    invoke-static {v0, p0, p2, p3}, Lx1/O;->z4(Ljava/lang/String;IJ)V

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_1

    .line 67
    .line 68
    const-string p0, "changeWorkspaceGridNum isCurShowingAIFutureWidget clearTempRemoveAiFutureScreenIfNeed"

    .line 69
    .line 70
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->M0()Lcom/android/launcher3/CellLayout;

    .line 78
    .line 79
    .line 80
    :cond_1
    sget-object p0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    move-object v2, p0

    .line 87
    check-cast v2, Lcom/android/launcher3/F1;

    .line 88
    .line 89
    const/4 v7, 0x0

    .line 90
    const/4 v8, 0x0

    .line 91
    const/4 v4, 0x0

    .line 92
    const/4 v5, 0x0

    .line 93
    const/4 v6, 0x0

    .line 94
    move-object v3, p1

    .line 95
    invoke-virtual/range {v2 .. v8}, Lcom/android/launcher3/F1;->q0(Landroid/content/Context;ZZZZZ)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string p1, "changeWorkspaceGridNum "

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string p1, " "

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string p1, " null"

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    :cond_3
    :goto_0
    return v1
.end method

.method public static o(I)Landroid/graphics/Point;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 4
    .line 5
    .line 6
    and-int/lit16 v1, p0, 0xf0

    .line 7
    .line 8
    shr-int/lit8 v1, v1, 0x4

    .line 9
    .line 10
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 11
    .line 12
    and-int/lit8 p0, p0, 0xf

    .line 13
    .line 14
    iput p0, v0, Landroid/graphics/Point;->y:I

    .line 15
    .line 16
    return-object v0
.end method

.method public static p(II)I
    .locals 0

    .line 1
    shl-int/lit8 p0, p0, 0x4

    .line 2
    .line 3
    add-int/2addr p0, p1

    .line 4
    return p0
.end method

.method private r(Lcom/android/launcher3/F1;Landroid/content/Context;II)V
    .locals 11

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "setGridSize: rows: "

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, " ,columns: "

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "DesktopGrid"

    .line 27
    .line 28
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    const-string p0, "window"

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Landroid/view/WindowManager;

    .line 38
    .line 39
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v1, Landroid/util/DisplayMetrics;

    .line 44
    .line 45
    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 49
    .line 50
    .line 51
    iput p3, p1, Lcom/android/launcher3/F1;->G0:I

    .line 52
    .line 53
    iput p4, p1, Lcom/android/launcher3/F1;->H0:I

    .line 54
    .line 55
    invoke-static {p3, p4}, Lcom/android/launcher3/b0;->p(II)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    sget-object v2, Lcom/android/launcher3/b0;->s:Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Lcom/android/launcher3/b0$e;

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    const-string v4, "setGridSize: "

    .line 73
    .line 74
    const/4 v5, 0x0

    .line 75
    const/4 v6, 0x2

    .line 76
    if-nez v2, :cond_6

    .line 77
    .line 78
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_1

    .line 87
    .line 88
    iget-boolean v2, p1, Lcom/android/launcher3/r4;->M:Z

    .line 89
    .line 90
    if-eqz v2, :cond_0

    .line 91
    .line 92
    new-instance v2, Lcom/android/launcher3/b0$e;

    .line 93
    .line 94
    const/high16 v7, 0x42980000    # 76.0f

    .line 95
    .line 96
    invoke-direct {v2, v7, v7, v7, v7}, Lcom/android/launcher3/b0$e;-><init>(FFFF)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    sget-object v2, Lcom/android/launcher3/b0;->h:Lcom/android/launcher3/b0$e;

    .line 101
    .line 102
    :goto_0
    invoke-static {}, Lm1/a;->c()Z

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    if-eqz v7, :cond_6

    .line 107
    .line 108
    sget-object v2, Lcom/android/launcher3/b0;->g:Lcom/android/launcher3/b0$e;

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->z()Z

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-eqz v2, :cond_2

    .line 120
    .line 121
    sget-object v2, Lcom/android/launcher3/b0;->m:Lcom/android/launcher3/b0$e;

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_2
    invoke-static {}, Lx1/O;->k1()Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_5

    .line 129
    .line 130
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    .line 139
    .line 140
    if-ne v2, v6, :cond_3

    .line 141
    .line 142
    sget-object v2, Lcom/android/launcher3/b0;->q:Lcom/android/launcher3/b0$e;

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_3
    sget-object v2, Lcom/android/launcher3/b0;->p:Lcom/android/launcher3/b0$e;

    .line 146
    .line 147
    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v8, ","

    .line 159
    .line 160
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v8, ",isLand = "

    .line 167
    .line 168
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 172
    .line 173
    .line 174
    move-result-object v8

    .line 175
    invoke-virtual {v8}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 176
    .line 177
    .line 178
    move-result-object v8

    .line 179
    iget v8, v8, Landroid/content/res/Configuration;->orientation:I

    .line 180
    .line 181
    if-ne v8, v6, :cond_4

    .line 182
    .line 183
    move v8, v3

    .line 184
    goto :goto_2

    .line 185
    :cond_4
    move v8, v5

    .line 186
    :goto_2
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v7

    .line 193
    invoke-static {v0, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_5
    sget-object v2, Lcom/android/launcher3/b0;->r:Lcom/android/launcher3/b0$e;

    .line 198
    .line 199
    :cond_6
    :goto_3
    invoke-virtual {v2}, Lcom/android/launcher3/b0$e;->b()F

    .line 200
    .line 201
    .line 202
    move-result v7

    .line 203
    invoke-virtual {p1}, Lcom/android/launcher3/r4;->o()F

    .line 204
    .line 205
    .line 206
    move-result v8

    .line 207
    const/4 v9, 0x0

    .line 208
    cmpg-float v9, v9, v8

    .line 209
    .line 210
    const/high16 v10, 0x3f800000    # 1.0f

    .line 211
    .line 212
    if-gtz v9, :cond_7

    .line 213
    .line 214
    cmpg-float v9, v8, v10

    .line 215
    .line 216
    if-gez v9, :cond_7

    .line 217
    .line 218
    invoke-virtual {v2}, Lcom/android/launcher3/b0$e;->c()F

    .line 219
    .line 220
    .line 221
    move-result v7

    .line 222
    invoke-virtual {v2}, Lcom/android/launcher3/b0$e;->b()F

    .line 223
    .line 224
    .line 225
    move-result v9

    .line 226
    invoke-virtual {v2}, Lcom/android/launcher3/b0$e;->c()F

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    sub-float/2addr v9, v2

    .line 231
    mul-float/2addr v9, v8

    .line 232
    :goto_4
    add-float/2addr v7, v9

    .line 233
    goto :goto_5

    .line 234
    :cond_7
    cmpg-float v9, v10, v8

    .line 235
    .line 236
    if-gtz v9, :cond_8

    .line 237
    .line 238
    const/high16 v9, 0x40000000    # 2.0f

    .line 239
    .line 240
    cmpg-float v9, v8, v9

    .line 241
    .line 242
    if-gtz v9, :cond_8

    .line 243
    .line 244
    invoke-virtual {v2}, Lcom/android/launcher3/b0$e;->b()F

    .line 245
    .line 246
    .line 247
    move-result v7

    .line 248
    invoke-virtual {v2}, Lcom/android/launcher3/b0$e;->a()F

    .line 249
    .line 250
    .line 251
    move-result v9

    .line 252
    invoke-virtual {v2}, Lcom/android/launcher3/b0$e;->b()F

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    sub-float/2addr v9, v2

    .line 257
    sub-float v2, v8, v10

    .line 258
    .line 259
    mul-float/2addr v9, v2

    .line 260
    goto :goto_4

    .line 261
    :cond_8
    :goto_5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .line 265
    .line 266
    const-string v9, "iconSize: "

    .line 267
    .line 268
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    const-string v9, " ,iconSizePercentage: "

    .line 275
    .line 276
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    .line 288
    .line 289
    iget-object v2, p1, Lcom/android/launcher3/F1;->L0:[F

    .line 290
    .line 291
    iget v8, p1, Lcom/android/launcher3/r4;->N:I

    .line 292
    .line 293
    mul-int/2addr v8, v6

    .line 294
    int-to-float v6, v8

    .line 295
    add-float/2addr v7, v6

    .line 296
    aput v7, v2, v3

    .line 297
    .line 298
    aput v7, v2, v5

    .line 299
    .line 300
    invoke-static {v7, v1}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    iput v1, p1, Lcom/android/launcher3/F1;->N0:I

    .line 305
    .line 306
    new-instance v1, Ljava/lang/StringBuilder;

    .line 307
    .line 308
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 309
    .line 310
    .line 311
    const-string v2, "setGridSize: iconBitmapSize: "

    .line 312
    .line 313
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    iget v2, p1, Lcom/android/launcher3/F1;->N0:I

    .line 317
    .line 318
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    .line 327
    .line 328
    iget v1, p1, Lcom/android/launcher3/F1;->N0:I

    .line 329
    .line 330
    invoke-virtual {p1, v1}, Lcom/android/launcher3/F1;->w0(I)I

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    iput v1, p1, Lcom/android/launcher3/F1;->O0:I

    .line 335
    .line 336
    iget-object v1, p1, Lcom/android/launcher3/F1;->L0:[F

    .line 337
    .line 338
    aget v1, v1, v5

    .line 339
    .line 340
    iput v1, p1, Lcom/android/launcher3/r4;->O:F

    .line 341
    .line 342
    iget p1, p1, Lcom/android/launcher3/F1;->d1:I

    .line 343
    .line 344
    invoke-static {p2, p4, p3, p1}, Lz1/i1;->s(Landroid/content/Context;III)V

    .line 345
    .line 346
    .line 347
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    const-string p2, "launcher_rows_columns"

    .line 352
    .line 353
    invoke-static {p1, p2, p0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 354
    .line 355
    .line 356
    return-void

    .line 357
    :catch_0
    move-exception p0

    .line 358
    invoke-static {v0, v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 359
    .line 360
    .line 361
    return-void
.end method


# virtual methods
.method public b(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/b0;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lcom/android/launcher3/D3;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "bindBeyondGridItems mBeyondGridItems.size(): "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/b0;->b:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "DesktopGrid"

    .line 25
    .line 26
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/b0;->b:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v2, 0x1

    .line 36
    if-ge v0, v2, :cond_0

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/b0;->b:Ljava/util/ArrayList;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/android/launcher3/b0;->f:Ljava/util/Comparator;

    .line 42
    .line 43
    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lcom/android/launcher3/b0;->b:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_1

    .line 62
    .line 63
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 68
    .line 69
    new-instance v5, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v6, "bindBeyondGridItems: "

    .line 75
    .line 76
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    invoke-static {v4, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_1
    invoke-virtual {p1, v0, v2}, Lcom/android/launcher3/D3;->K(Ljava/util/ArrayList;Z)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/android/launcher3/b0;->b:Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public d(Landroid/content/Context;F)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p2, v0

    .line 3
    .line 4
    if-ltz v0, :cond_2

    .line 5
    .line 6
    const/high16 v0, 0x40000000    # 2.0f

    .line 7
    .line 8
    cmpl-float v0, p2, v0

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/r4;->J(Landroid/content/Context;F)V

    .line 22
    .line 23
    .line 24
    iget p2, v0, Lcom/android/launcher3/F1;->G0:I

    .line 25
    .line 26
    iget v1, v0, Lcom/android/launcher3/F1;->H0:I

    .line 27
    .line 28
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/android/launcher3/b0;->r(Lcom/android/launcher3/F1;Landroid/content/Context;II)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lx1/O;->z5()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 p2, 0x2

    .line 42
    const-wide/16 v0, 0xbb8

    .line 43
    .line 44
    invoke-static {p0, p2, v0, v1}, Lx1/O;->z4(Ljava/lang/String;IJ)V

    .line 45
    .line 46
    .line 47
    :cond_1
    sget-object p0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    move-object v0, p0

    .line 54
    check-cast v0, Lcom/android/launcher3/F1;

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    const/4 v6, 0x0

    .line 58
    const/4 v2, 0x0

    .line 59
    const/4 v3, 0x0

    .line 60
    const/4 v4, 0x0

    .line 61
    move-object v1, p1

    .line 62
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/F1;->q0(Landroid/content/Context;ZZZZZ)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    :goto_0
    const-string p0, "DesktopGrid"

    .line 67
    .line 68
    const-string p1, "changeIconSize: percentage wrong!"

    .line 69
    .line 70
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public e(Landroid/content/Context;I)Z
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget v0, p2, Landroid/graphics/Point;->x:I

    .line 6
    .line 7
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 8
    .line 9
    invoke-direct {p0, p1, v0, p2}, Lcom/android/launcher3/b0;->f(Landroid/content/Context;II)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public g(Lcom/android/launcher3/F1;Lz1/y0;Landroid/content/Context;Z)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    new-instance v4, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    new-instance v6, Lcom/android/launcher3/util/x0;

    .line 19
    .line 20
    invoke-direct {v6}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v7, v0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 24
    .line 25
    invoke-virtual {v7}, Landroid/util/ArrayMap;->size()I

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    const/4 v8, 0x2

    .line 30
    const-string v9, "DesktopGrid"

    .line 31
    .line 32
    const/4 v10, 0x0

    .line 33
    if-lez v7, :cond_8

    .line 34
    .line 35
    new-instance v7, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v12, "doReGridData--sResizeGridMap.size()="

    .line 41
    .line 42
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v12, v0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 46
    .line 47
    invoke-virtual {v12}, Landroid/util/ArrayMap;->size()I

    .line 48
    .line 49
    .line 50
    move-result v12

    .line 51
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v12, " restoreResizeLayout:"

    .line 55
    .line 56
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    invoke-static {v9, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    iget-object v7, v0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 70
    .line 71
    invoke-virtual {v7}, Landroid/util/ArrayMap;->entrySet()Ljava/util/Set;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 80
    .line 81
    .line 82
    move-result v12

    .line 83
    if-eqz v12, :cond_8

    .line 84
    .line 85
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v12

    .line 89
    check-cast v12, Ljava/util/Map$Entry;

    .line 90
    .line 91
    invoke-interface {v12}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v13

    .line 95
    check-cast v13, Ljava/util/ArrayList;

    .line 96
    .line 97
    if-eqz v13, :cond_7

    .line 98
    .line 99
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    .line 100
    .line 101
    .line 102
    move-result v14

    .line 103
    if-lez v14, :cond_7

    .line 104
    .line 105
    iget-object v14, v0, Lcom/android/launcher3/b0;->e:Ljava/util/Comparator;

    .line 106
    .line 107
    invoke-static {v13, v14}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 108
    .line 109
    .line 110
    iget-object v14, v0, Lcom/android/launcher3/b0;->c:Lcom/android/launcher3/util/A0;

    .line 111
    .line 112
    invoke-virtual {v13, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v15

    .line 116
    check-cast v15, Lcom/android/launcher3/model/data/y;

    .line 117
    .line 118
    iget v15, v15, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 119
    .line 120
    invoke-virtual {v14, v15}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v14

    .line 124
    check-cast v14, Lcom/android/launcher3/util/t0;

    .line 125
    .line 126
    if-nez v14, :cond_0

    .line 127
    .line 128
    const-string v12, "doReGridData--screens is null"

    .line 129
    .line 130
    invoke-static {v9, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_0
    iget v15, v1, Lcom/android/launcher3/F1;->H0:I

    .line 135
    .line 136
    move/from16 v16, v10

    .line 137
    .line 138
    iget v10, v1, Lcom/android/launcher3/F1;->G0:I

    .line 139
    .line 140
    const/16 v17, 0x1

    .line 141
    .line 142
    new-instance v11, Lcom/android/launcher3/util/t0;

    .line 143
    .line 144
    invoke-direct {v11, v15, v10}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v11}, Lcom/android/launcher3/util/t0;->a()V

    .line 148
    .line 149
    .line 150
    invoke-interface {v12}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v12

    .line 154
    check-cast v12, Ljava/lang/Integer;

    .line 155
    .line 156
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 160
    .line 161
    .line 162
    move-result-object v12

    .line 163
    const/4 v13, -0x1

    .line 164
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 165
    .line 166
    .line 167
    move-result v18

    .line 168
    if-eqz v18, :cond_6

    .line 169
    .line 170
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v18

    .line 174
    move-object/from16 v3, v18

    .line 175
    .line 176
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 177
    .line 178
    move-object/from16 v18, v7

    .line 179
    .line 180
    new-array v7, v8, [I

    .line 181
    .line 182
    iget v8, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 183
    .line 184
    move-object/from16 v19, v11

    .line 185
    .line 186
    iget v11, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 187
    .line 188
    invoke-virtual {v14, v7, v8, v11}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 189
    .line 190
    .line 191
    move-result v8

    .line 192
    if-eqz v8, :cond_1

    .line 193
    .line 194
    aget v8, v7, v16

    .line 195
    .line 196
    iput v8, v3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 197
    .line 198
    aget v7, v7, v17

    .line 199
    .line 200
    iput v7, v3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 201
    .line 202
    move/from16 v7, v17

    .line 203
    .line 204
    invoke-virtual {v14, v3, v7}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 205
    .line 206
    .line 207
    move-object/from16 v11, v19

    .line 208
    .line 209
    move-object/from16 v19, v4

    .line 210
    .line 211
    goto/16 :goto_7

    .line 212
    .line 213
    :cond_1
    if-eqz p4, :cond_2

    .line 214
    .line 215
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    new-instance v7, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 221
    .line 222
    .line 223
    const-string v8, "doReGridData, restoreResizeLayout itemInfo:"

    .line 224
    .line 225
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    invoke-static {v9, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    move/from16 v3, p4

    .line 243
    .line 244
    move-object/from16 v7, v18

    .line 245
    .line 246
    move-object/from16 v11, v19

    .line 247
    .line 248
    :goto_2
    const/4 v8, 0x2

    .line 249
    const/16 v17, 0x1

    .line 250
    .line 251
    goto :goto_1

    .line 252
    :cond_2
    if-gez v13, :cond_4

    .line 253
    .line 254
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    .line 255
    .line 256
    .line 257
    move-result v7

    .line 258
    if-lez v7, :cond_3

    .line 259
    .line 260
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    .line 261
    .line 262
    .line 263
    move-result v7

    .line 264
    const/16 v17, 0x1

    .line 265
    .line 266
    add-int/lit8 v7, v7, -0x1

    .line 267
    .line 268
    invoke-virtual {v6, v7}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 269
    .line 270
    .line 271
    move-result v7

    .line 272
    add-int/lit8 v7, v7, 0x1

    .line 273
    .line 274
    :goto_3
    move v13, v7

    .line 275
    goto :goto_4

    .line 276
    :cond_3
    invoke-static/range {p3 .. p3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 277
    .line 278
    .line 279
    move-result-object v7

    .line 280
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 281
    .line 282
    .line 283
    move-result-object v7

    .line 284
    invoke-virtual {v7}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 285
    .line 286
    .line 287
    move-result-object v7

    .line 288
    invoke-virtual {v7}, Lz1/k2;->F()I

    .line 289
    .line 290
    .line 291
    move-result v7

    .line 292
    goto :goto_3

    .line 293
    :goto_4
    invoke-virtual {v5, v13}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v6, v13}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 297
    .line 298
    .line 299
    new-instance v11, Lcom/android/launcher3/util/t0;

    .line 300
    .line 301
    invoke-direct {v11, v15, v10}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v11}, Lcom/android/launcher3/util/t0;->a()V

    .line 305
    .line 306
    .line 307
    iget-object v7, v0, Lcom/android/launcher3/b0;->c:Lcom/android/launcher3/util/A0;

    .line 308
    .line 309
    invoke-virtual {v7, v13, v11}, Landroid/util/SparseArray;->set(ILjava/lang/Object;)V

    .line 310
    .line 311
    .line 312
    :goto_5
    const/4 v7, 0x2

    .line 313
    goto :goto_6

    .line 314
    :cond_4
    move-object/from16 v11, v19

    .line 315
    .line 316
    goto :goto_5

    .line 317
    :goto_6
    new-array v8, v7, [I

    .line 318
    .line 319
    iget v7, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 320
    .line 321
    move-object/from16 v19, v4

    .line 322
    .line 323
    iget v4, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 324
    .line 325
    invoke-virtual {v11, v8, v7, v4}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 326
    .line 327
    .line 328
    move-result v4

    .line 329
    if-eqz v4, :cond_5

    .line 330
    .line 331
    aget v4, v8, v16

    .line 332
    .line 333
    iput v4, v3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 334
    .line 335
    const/4 v7, 0x1

    .line 336
    aget v4, v8, v7

    .line 337
    .line 338
    iput v4, v3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 339
    .line 340
    iput v13, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 341
    .line 342
    invoke-virtual {v11, v3, v7}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 343
    .line 344
    .line 345
    :cond_5
    :goto_7
    move/from16 v3, p4

    .line 346
    .line 347
    move-object/from16 v7, v18

    .line 348
    .line 349
    move-object/from16 v4, v19

    .line 350
    .line 351
    goto :goto_2

    .line 352
    :cond_6
    move-object/from16 v19, v4

    .line 353
    .line 354
    move-object/from16 v18, v7

    .line 355
    .line 356
    goto :goto_8

    .line 357
    :cond_7
    move-object/from16 v19, v4

    .line 358
    .line 359
    move-object/from16 v18, v7

    .line 360
    .line 361
    move/from16 v16, v10

    .line 362
    .line 363
    :goto_8
    move/from16 v3, p4

    .line 364
    .line 365
    move/from16 v10, v16

    .line 366
    .line 367
    move-object/from16 v7, v18

    .line 368
    .line 369
    move-object/from16 v4, v19

    .line 370
    .line 371
    const/4 v8, 0x2

    .line 372
    goto/16 :goto_0

    .line 373
    .line 374
    :cond_8
    move-object/from16 v19, v4

    .line 375
    .line 376
    move/from16 v16, v10

    .line 377
    .line 378
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    .line 379
    .line 380
    .line 381
    move-result v3

    .line 382
    if-lez v3, :cond_c

    .line 383
    .line 384
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    .line 385
    .line 386
    .line 387
    move-result v3

    .line 388
    if-lez v3, :cond_9

    .line 389
    .line 390
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    .line 391
    .line 392
    .line 393
    move-result v3

    .line 394
    const/16 v17, 0x1

    .line 395
    .line 396
    add-int/lit8 v3, v3, -0x1

    .line 397
    .line 398
    invoke-virtual {v6, v3}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 399
    .line 400
    .line 401
    move-result v3

    .line 402
    add-int/lit8 v3, v3, 0x1

    .line 403
    .line 404
    goto :goto_9

    .line 405
    :cond_9
    invoke-static/range {p3 .. p3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 406
    .line 407
    .line 408
    move-result-object v3

    .line 409
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 410
    .line 411
    .line 412
    move-result-object v3

    .line 413
    invoke-virtual {v3}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 414
    .line 415
    .line 416
    move-result-object v3

    .line 417
    invoke-virtual {v3}, Lz1/k2;->F()I

    .line 418
    .line 419
    .line 420
    move-result v3

    .line 421
    :goto_9
    invoke-virtual {v5, v3}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 422
    .line 423
    .line 424
    invoke-virtual {v6, v3}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 425
    .line 426
    .line 427
    iget v4, v1, Lcom/android/launcher3/F1;->H0:I

    .line 428
    .line 429
    iget v1, v1, Lcom/android/launcher3/F1;->G0:I

    .line 430
    .line 431
    new-instance v7, Lcom/android/launcher3/util/t0;

    .line 432
    .line 433
    invoke-direct {v7, v4, v1}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v7}, Lcom/android/launcher3/util/t0;->a()V

    .line 437
    .line 438
    .line 439
    iget-object v8, v0, Lcom/android/launcher3/b0;->c:Lcom/android/launcher3/util/A0;

    .line 440
    .line 441
    invoke-virtual {v8, v3, v7}, Landroid/util/SparseArray;->set(ILjava/lang/Object;)V

    .line 442
    .line 443
    .line 444
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 445
    .line 446
    .line 447
    move-result-object v8

    .line 448
    :goto_a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 449
    .line 450
    .line 451
    move-result v10

    .line 452
    if-eqz v10, :cond_c

    .line 453
    .line 454
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 455
    .line 456
    .line 457
    move-result-object v10

    .line 458
    check-cast v10, Lcom/android/launcher3/model/data/y;

    .line 459
    .line 460
    const/4 v11, 0x2

    .line 461
    new-array v12, v11, [I

    .line 462
    .line 463
    iget v11, v10, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 464
    .line 465
    iget v13, v10, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 466
    .line 467
    invoke-virtual {v7, v12, v11, v13}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 468
    .line 469
    .line 470
    move-result v11

    .line 471
    if-eqz v11, :cond_a

    .line 472
    .line 473
    aget v11, v12, v16

    .line 474
    .line 475
    iput v11, v10, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 476
    .line 477
    const/4 v11, 0x1

    .line 478
    aget v12, v12, v11

    .line 479
    .line 480
    iput v12, v10, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 481
    .line 482
    iput v3, v10, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 483
    .line 484
    invoke-virtual {v7, v10, v11}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 485
    .line 486
    .line 487
    const/4 v11, 0x2

    .line 488
    goto :goto_a

    .line 489
    :cond_a
    const/4 v11, 0x1

    .line 490
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    .line 491
    .line 492
    .line 493
    move-result v3

    .line 494
    sub-int/2addr v3, v11

    .line 495
    invoke-virtual {v6, v3}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 496
    .line 497
    .line 498
    move-result v3

    .line 499
    add-int/2addr v3, v11

    .line 500
    invoke-virtual {v5, v3}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 501
    .line 502
    .line 503
    invoke-virtual {v6, v3}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 504
    .line 505
    .line 506
    new-instance v7, Lcom/android/launcher3/util/t0;

    .line 507
    .line 508
    invoke-direct {v7, v4, v1}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 509
    .line 510
    .line 511
    invoke-virtual {v7}, Lcom/android/launcher3/util/t0;->a()V

    .line 512
    .line 513
    .line 514
    iget-object v11, v0, Lcom/android/launcher3/b0;->c:Lcom/android/launcher3/util/A0;

    .line 515
    .line 516
    invoke-virtual {v11, v3, v7}, Landroid/util/SparseArray;->set(ILjava/lang/Object;)V

    .line 517
    .line 518
    .line 519
    const/4 v11, 0x2

    .line 520
    new-array v12, v11, [I

    .line 521
    .line 522
    iget v13, v10, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 523
    .line 524
    iget v14, v10, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 525
    .line 526
    invoke-virtual {v7, v12, v13, v14}, Lcom/android/launcher3/util/t0;->c([III)Z

    .line 527
    .line 528
    .line 529
    move-result v13

    .line 530
    if-eqz v13, :cond_b

    .line 531
    .line 532
    aget v13, v12, v16

    .line 533
    .line 534
    iput v13, v10, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 535
    .line 536
    const/4 v13, 0x1

    .line 537
    aget v12, v12, v13

    .line 538
    .line 539
    iput v12, v10, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 540
    .line 541
    iput v3, v10, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 542
    .line 543
    invoke-virtual {v7, v10, v13}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 544
    .line 545
    .line 546
    goto :goto_a

    .line 547
    :cond_b
    new-instance v12, Ljava/lang/StringBuilder;

    .line 548
    .line 549
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 550
    .line 551
    .line 552
    const-string v13, "doReGridData, spaceFinderRestoreItemInfoList, countX:"

    .line 553
    .line 554
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    .line 556
    .line 557
    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 558
    .line 559
    .line 560
    const-string v13, " countY:"

    .line 561
    .line 562
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 566
    .line 567
    .line 568
    const-string v13, " newWorkspaceScreenId:"

    .line 569
    .line 570
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    .line 572
    .line 573
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    const-string v13, " itemInfo:"

    .line 577
    .line 578
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    .line 580
    .line 581
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/y;->toString()Ljava/lang/String;

    .line 582
    .line 583
    .line 584
    move-result-object v10

    .line 585
    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 586
    .line 587
    .line 588
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 589
    .line 590
    .line 591
    move-result-object v10

    .line 592
    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    .line 594
    .line 595
    goto/16 :goto_a

    .line 596
    .line 597
    :cond_c
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 598
    .line 599
    .line 600
    move-result-object v1

    .line 601
    if-eqz v1, :cond_d

    .line 602
    .line 603
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 604
    .line 605
    .line 606
    move-result-object v3

    .line 607
    invoke-virtual {v3}, Lcom/android/launcher3/D3;->l0()I

    .line 608
    .line 609
    .line 610
    move-result v3

    .line 611
    iput v3, v2, Lz1/y0;->g:I

    .line 612
    .line 613
    :cond_d
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 614
    .line 615
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 616
    .line 617
    .line 618
    move-result-object v2

    .line 619
    :cond_e
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 620
    .line 621
    .line 622
    move-result v3

    .line 623
    if-eqz v3, :cond_f

    .line 624
    .line 625
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 626
    .line 627
    .line 628
    move-result-object v3

    .line 629
    move-object v5, v3

    .line 630
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 631
    .line 632
    if-eqz v5, :cond_e

    .line 633
    .line 634
    if-eqz v1, :cond_e

    .line 635
    .line 636
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 637
    .line 638
    .line 639
    move-result-object v4

    .line 640
    iget v6, v5, Lcom/android/launcher3/model/data/y;->container:I

    .line 641
    .line 642
    iget v7, v5, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 643
    .line 644
    iget v8, v5, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 645
    .line 646
    iget v9, v5, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 647
    .line 648
    iget v10, v5, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 649
    .line 650
    iget v11, v5, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 651
    .line 652
    invoke-virtual/range {v4 .. v11}, Lz1/J3;->R(Lcom/android/launcher3/model/data/y;IIIIII)V

    .line 653
    .line 654
    .line 655
    goto :goto_b

    .line 656
    :cond_f
    iget-object v2, v0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 657
    .line 658
    invoke-virtual {v2}, Landroid/util/ArrayMap;->clear()V

    .line 659
    .line 660
    .line 661
    const/4 v2, 0x0

    .line 662
    iput-object v2, v0, Lcom/android/launcher3/b0;->c:Lcom/android/launcher3/util/A0;

    .line 663
    .line 664
    invoke-static/range {p3 .. p3}, Lx1/C;->f(Landroid/content/Context;)Lx1/C;

    .line 665
    .line 666
    .line 667
    move-result-object v0

    .line 668
    const/4 v7, 0x1

    .line 669
    invoke-virtual {v0, v7}, Lx1/C;->e(Z)V

    .line 670
    .line 671
    .line 672
    if-eqz v1, :cond_10

    .line 673
    .line 674
    move/from16 v0, v16

    .line 675
    .line 676
    invoke-virtual {v1, v0}, Lcom/android/launcher3/C2;->B4(Z)V

    .line 677
    .line 678
    .line 679
    :cond_10
    return-void
.end method

.method public h()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/b0;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Landroid/content/Context;)Landroid/graphics/Point;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/b0;->j(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, -0x1

    .line 6
    if-ne p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public j(Landroid/content/Context;)I
    .locals 6

    .line 1
    const/4 v0, -0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "num_of_rows_columns"

    .line 10
    .line 11
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/16 v2, 0x74

    .line 16
    .line 17
    const-string v3, "DesktopGrid"

    .line 18
    .line 19
    if-ne v1, v0, :cond_7

    .line 20
    .line 21
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    invoke-static {}, Lm1/a;->c()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const/16 v2, 0x53

    .line 38
    .line 39
    goto/16 :goto_3

    .line 40
    .line 41
    :cond_1
    const/16 v2, 0x43

    .line 42
    .line 43
    goto/16 :goto_3

    .line 44
    .line 45
    :cond_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_3

    .line 54
    .line 55
    goto/16 :goto_3

    .line 56
    .line 57
    :cond_3
    const-string p0, "config_num_rows"

    .line 58
    .line 59
    invoke-static {p1, p0}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    const-string v0, "config_num_columns"

    .line 64
    .line 65
    invoke-static {p1, v0}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-static {p0, v0}, Lcom/android/launcher3/b0;->p(II)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    sget-object v0, Lcom/android/launcher3/b0;->s:Ljava/util/HashMap;

    .line 74
    .line 75
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    invoke-static {}, Lx1/O;->k1()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_6

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    .line 100
    .line 101
    const/4 p1, 0x2

    .line 102
    if-ne p0, p1, :cond_4

    .line 103
    .line 104
    const/16 p0, 0x48

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_4
    const/16 p0, 0x84

    .line 108
    .line 109
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v0, "bestie getGridNumOfRowsAndColumnsInt: "

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    :cond_5
    :goto_1
    move v2, p0

    .line 130
    goto/16 :goto_3

    .line 131
    .line 132
    :cond_6
    const/16 p0, 0x64

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_7
    sget-object v0, Lcom/android/launcher3/b0$f;->h:Lcom/android/launcher3/b0$f;

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/android/launcher3/b0$f;->c()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    const/4 v4, 0x1

    .line 142
    if-ne v1, v0, :cond_8

    .line 143
    .line 144
    sget-object v0, Lcom/android/launcher3/b0$f;->j:Lcom/android/launcher3/b0$f;

    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/android/launcher3/b0$f;->c()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    goto :goto_2

    .line 151
    :cond_8
    sget-object v0, Lcom/android/launcher3/b0$f;->i:Lcom/android/launcher3/b0$f;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/android/launcher3/b0$f;->c()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-ne v1, v0, :cond_9

    .line 158
    .line 159
    sget-object v0, Lcom/android/launcher3/b0$f;->k:Lcom/android/launcher3/b0$f;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/android/launcher3/b0$f;->c()I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    goto :goto_2

    .line 166
    :cond_9
    const/4 v4, 0x0

    .line 167
    :goto_2
    if-eqz v4, :cond_a

    .line 168
    .line 169
    invoke-static {v1}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iget v4, v0, Landroid/graphics/Point;->x:I

    .line 174
    .line 175
    iget v5, v0, Landroid/graphics/Point;->y:I

    .line 176
    .line 177
    invoke-virtual {p0, p1, v4, v5}, Lcom/android/launcher3/b0;->q(Landroid/content/Context;II)Z

    .line 178
    .line 179
    .line 180
    new-instance v4, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    .line 184
    .line 185
    const-string v5, "getGridNumOfRowsAndColumnsInt newRows: "

    .line 186
    .line 187
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget v5, v0, Landroid/graphics/Point;->x:I

    .line 191
    .line 192
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    const-string v5, " ,newColumns: "

    .line 196
    .line 197
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 201
    .line 202
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    .line 211
    .line 212
    :cond_a
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-eqz v0, :cond_b

    .line 221
    .line 222
    if-eq v1, v2, :cond_b

    .line 223
    .line 224
    invoke-static {v2}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 229
    .line 230
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 231
    .line 232
    invoke-virtual {p0, p1, v1, v0}, Lcom/android/launcher3/b0;->q(Landroid/content/Context;II)Z

    .line 233
    .line 234
    .line 235
    const-string p0, "getGridNumOfRowsAndColumnsInt: streamer nums wrong, change it!"

    .line 236
    .line 237
    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    goto :goto_3

    .line 241
    :cond_b
    move v2, v1

    .line 242
    :goto_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 243
    .line 244
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 245
    .line 246
    .line 247
    const-string p1, "getGridNumOfRowsAndColumnsInt: "

    .line 248
    .line 249
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    .line 261
    .line 262
    return v2
.end method

.method public k(Landroid/content/Context;)Landroid/graphics/Point;
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "num_of_rows_columns"

    .line 6
    .line 7
    const/4 v2, -0x1

    .line 8
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    new-instance v1, Landroid/graphics/Point;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-direct {v1, v3, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 16
    .line 17
    .line 18
    const-string v3, "--point.y:"

    .line 19
    .line 20
    const-string v4, "DesktopGrid"

    .line 21
    .line 22
    const/16 v5, 0x74

    .line 23
    .line 24
    if-ne v0, v2, :cond_5

    .line 25
    .line 26
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    const/16 p0, 0x43

    .line 37
    .line 38
    invoke-static {p0}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {}, Lm1/a;->c()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_4

    .line 47
    .line 48
    const/16 p0, 0x53

    .line 49
    .line 50
    invoke-static {p0}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    goto :goto_1

    .line 55
    :cond_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->z()Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    invoke-static {v5}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    invoke-static {}, Lx1/O;->k1()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    .line 85
    .line 86
    const/4 p1, 0x2

    .line 87
    if-ne p0, p1, :cond_2

    .line 88
    .line 89
    const/16 p0, 0x48

    .line 90
    .line 91
    :goto_0
    invoke-static {p0}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    move-object v1, p0

    .line 96
    goto :goto_1

    .line 97
    :cond_2
    const/16 p0, 0x84

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_3
    const-string p0, "config_num_rows"

    .line 101
    .line 102
    invoke-static {p1, p0}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    iput p0, v1, Landroid/graphics/Point;->x:I

    .line 107
    .line 108
    const-string p0, "config_num_columns"

    .line 109
    .line 110
    invoke-static {p1, p0}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    iput p0, v1, Landroid/graphics/Point;->y:I

    .line 115
    .line 116
    :cond_4
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    const-string p1, "getRowsAndColumnsFromInt--nums == -1--point.x:"

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    iget p1, v1, Landroid/graphics/Point;->x:I

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget p1, v1, Landroid/graphics/Point;->y:I

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-static {v4, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    return-object v1

    .line 147
    :cond_5
    invoke-static {v0}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->z()Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-eqz v2, :cond_6

    .line 160
    .line 161
    if-eq v0, v5, :cond_6

    .line 162
    .line 163
    invoke-static {v5}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    iget v0, v1, Landroid/graphics/Point;->x:I

    .line 168
    .line 169
    iget v2, v1, Landroid/graphics/Point;->y:I

    .line 170
    .line 171
    invoke-virtual {p0, p1, v0, v2}, Lcom/android/launcher3/b0;->q(Landroid/content/Context;II)Z

    .line 172
    .line 173
    .line 174
    const-string p0, "getRowsAndColumnsFromInt: streamer nums wrong, change it!"

    .line 175
    .line 176
    invoke-static {v4, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 182
    .line 183
    .line 184
    const-string p1, "getRowsAndColumnsFromInt--point.x:"

    .line 185
    .line 186
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    iget p1, v1, Landroid/graphics/Point;->x:I

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    iget p1, v1, Landroid/graphics/Point;->y:I

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-static {v4, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    return-object v1
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/b0;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/Point;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/launcher3/b0;->s:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-static {v1}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-object p0
.end method

.method public n(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    iget p3, p3, Landroid/content/res/Configuration;->orientation:I

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    if-ne p3, v0, :cond_1

    .line 26
    .line 27
    const/4 p3, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p3, 0x0

    .line 30
    :goto_0
    if-eqz p3, :cond_2

    .line 31
    .line 32
    sget-object v0, Lcom/android/launcher3/b0;->q:Lcom/android/launcher3/b0$e;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    sget-object v0, Lcom/android/launcher3/b0;->p:Lcom/android/launcher3/b0$e;

    .line 36
    .line 37
    :goto_1
    sput-object v0, Lcom/android/launcher3/b0;->r:Lcom/android/launcher3/b0$e;

    .line 38
    .line 39
    if-eqz p3, :cond_3

    .line 40
    .line 41
    new-instance v0, Lcom/android/launcher3/b0$b;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Lcom/android/launcher3/b0$b;-><init>(Lcom/android/launcher3/b0;)V

    .line 44
    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    new-instance v0, Lcom/android/launcher3/b0$c;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lcom/android/launcher3/b0$c;-><init>(Lcom/android/launcher3/b0;)V

    .line 50
    .line 51
    .line 52
    :goto_2
    sput-object v0, Lcom/android/launcher3/b0;->s:Ljava/util/HashMap;

    .line 53
    .line 54
    if-eqz p3, :cond_4

    .line 55
    .line 56
    const/16 p3, 0x48

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_4
    const/16 p3, 0x84

    .line 60
    .line 61
    :goto_3
    invoke-static {p3}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    iget v0, p3, Landroid/graphics/Point;->x:I

    .line 66
    .line 67
    iget p3, p3, Landroid/graphics/Point;->y:I

    .line 68
    .line 69
    invoke-direct {p0, p2, p1, v0, p3}, Lcom/android/launcher3/b0;->r(Lcom/android/launcher3/F1;Landroid/content/Context;II)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    if-eqz p3, :cond_6

    .line 78
    .line 79
    iget v0, p3, Landroid/graphics/Point;->x:I

    .line 80
    .line 81
    iget p3, p3, Landroid/graphics/Point;->y:I

    .line 82
    .line 83
    invoke-direct {p0, p2, p1, v0, p3}, Lcom/android/launcher3/b0;->r(Lcom/android/launcher3/F1;Landroid/content/Context;II)V

    .line 84
    .line 85
    .line 86
    :cond_6
    return-void
.end method

.method public q(Landroid/content/Context;II)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    if-lez p2, :cond_3

    .line 5
    .line 6
    if-gtz p3, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "saveGridNumOfRowsAndColumns: rows-columns "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, "-"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "DesktopGrid"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    invoke-static {p2, p3}, Lcom/android/launcher3/b0;->p(II)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-virtual {p3}, Lcom/android/launcher3/resource/B;->z()Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-nez p3, :cond_1

    .line 52
    .line 53
    sget-object p3, Lcom/android/launcher3/b0;->s:Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    if-nez p3, :cond_2

    .line 64
    .line 65
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    invoke-virtual {p3}, Lcom/android/launcher3/resource/B;->z()Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-eqz p3, :cond_3

    .line 74
    .line 75
    const/16 p3, 0x74

    .line 76
    .line 77
    if-ne p2, p3, :cond_3

    .line 78
    .line 79
    :cond_2
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string p1, "num_of_rows_columns"

    .line 88
    .line 89
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 94
    .line 95
    .line 96
    const/4 p0, 0x1

    .line 97
    :cond_3
    :goto_0
    return p0
.end method

.method public s(Lcom/android/launcher3/util/A0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/util/t0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/b0;->c:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    return-void
.end method

.method public t(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setShouldResize"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "DesktopGrid"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/android/launcher3/b0;->d:Z

    .line 24
    .line 25
    return-void
.end method

.method public u(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/util/t0;)Z
    .locals 9

    .line 1
    const-string v0, "DesktopGrid"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget v1, p3, Lcom/android/launcher3/model/data/y;->container:I

    .line 8
    .line 9
    const/16 v2, -0x64

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    return v3

    .line 15
    :cond_0
    iget v1, p2, Lcom/android/launcher3/F1;->H0:I

    .line 16
    .line 17
    iget p2, p2, Lcom/android/launcher3/F1;->G0:I

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    :try_start_0
    instance-of v4, p3, Lcom/android/launcher3/model/data/A;

    .line 21
    .line 22
    if-eqz v4, :cond_1

    .line 23
    .line 24
    move-object v4, p3

    .line 25
    check-cast v4, Lcom/android/launcher3/model/data/A;

    .line 26
    .line 27
    new-instance v5, Lcom/android/launcher3/widget/Y0;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-direct {v5, p1}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/A;->getTargetComponent()Landroid/content/ComponentName;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v4, p3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 41
    .line 42
    invoke-virtual {v5, p1, v4}, Lcom/android/launcher3/widget/Y0;->d(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/widget/U;

    .line 43
    .line 44
    .line 45
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception p1

    .line 48
    const-string v4, "updateGridData: "

    .line 49
    .line 50
    invoke-static {v0, v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_0
    iget p1, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 54
    .line 55
    iget v4, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 56
    .line 57
    add-int/2addr p1, v4

    .line 58
    const/4 v5, 0x5

    .line 59
    const/4 v6, 0x4

    .line 60
    const/4 v7, 0x1

    .line 61
    if-gt p1, v1, :cond_9

    .line 62
    .line 63
    iget p1, p3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 64
    .line 65
    iget v8, p3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 66
    .line 67
    add-int/2addr p1, v8

    .line 68
    if-le p1, p2, :cond_2

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_2
    iget p1, p3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 72
    .line 73
    if-eq p1, v6, :cond_7

    .line 74
    .line 75
    if-ne p1, v5, :cond_3

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_3
    const/4 p2, 0x2

    .line 79
    if-ne p1, p2, :cond_5

    .line 80
    .line 81
    if-gt v4, v7, :cond_4

    .line 82
    .line 83
    if-le v8, v7, :cond_5

    .line 84
    .line 85
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    const-string p2, "updateGridData, folder item:"

    .line 91
    .line 92
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    goto/16 :goto_9

    .line 106
    .line 107
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 108
    .line 109
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 110
    .line 111
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-virtual {p1, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Ljava/util/ArrayList;

    .line 120
    .line 121
    if-eqz p1, :cond_6

    .line 122
    .line 123
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_6
    new-instance p1, Ljava/util/ArrayList;

    .line 128
    .line 129
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 136
    .line 137
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 138
    .line 139
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-virtual {p0, p2, p1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    :goto_1
    return v7

    .line 147
    :cond_7
    :goto_2
    if-nez v2, :cond_8

    .line 148
    .line 149
    new-instance p1, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string p2, "updateGridData, widget item:"

    .line 155
    .line 156
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    goto/16 :goto_9

    .line 170
    .line 171
    :cond_8
    iget p1, v2, Lcom/android/launcher3/widget/U;->g:I

    .line 172
    .line 173
    iput p1, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 174
    .line 175
    goto/16 :goto_9

    .line 176
    .line 177
    :cond_9
    :goto_3
    iget p1, p3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 178
    .line 179
    if-eq p1, v6, :cond_b

    .line 180
    .line 181
    if-eq p1, v5, :cond_b

    .line 182
    .line 183
    iget-object p1, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 184
    .line 185
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 186
    .line 187
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    invoke-virtual {p1, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    check-cast p1, Ljava/util/ArrayList;

    .line 196
    .line 197
    if-eqz p1, :cond_a

    .line 198
    .line 199
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    goto :goto_4

    .line 203
    :cond_a
    new-instance p1, Ljava/util/ArrayList;

    .line 204
    .line 205
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    iget-object p0, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 212
    .line 213
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 214
    .line 215
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    invoke-virtual {p0, p2, p1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    :goto_4
    return v7

    .line 223
    :cond_b
    new-instance p1, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 226
    .line 227
    .line 228
    const-string v4, "updateGridData, widget, out of bounds--item.title=="

    .line 229
    .line 230
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    iget-object v4, p3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 234
    .line 235
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    const-string v4, "--item.itemType="

    .line 239
    .line 240
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    iget v4, p3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 244
    .line 245
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    const-string v4, "--item.cellX="

    .line 249
    .line 250
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    iget v4, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 254
    .line 255
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    const-string v4, "--item.cellY=="

    .line 259
    .line 260
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    iget v4, p3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 264
    .line 265
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    const-string v4, "--item.spanX="

    .line 269
    .line 270
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    iget v4, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 274
    .line 275
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    const-string v4, "--item.spanY=="

    .line 279
    .line 280
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    iget v4, p3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 284
    .line 285
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    const-string v4, " item.minSpanX:"

    .line 289
    .line 290
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    iget v4, p3, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 294
    .line 295
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    const-string v4, " item.minSpanY:"

    .line 299
    .line 300
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    iget v4, p3, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 304
    .line 305
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    const-string v4, "--item.screenId="

    .line 309
    .line 310
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    iget v4, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 314
    .line 315
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    .line 324
    .line 325
    iget p1, p3, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 326
    .line 327
    if-gt p1, v1, :cond_18

    .line 328
    .line 329
    iget p1, p3, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 330
    .line 331
    if-le p1, p2, :cond_c

    .line 332
    .line 333
    goto/16 :goto_a

    .line 334
    .line 335
    :cond_c
    iget p1, p3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 336
    .line 337
    iget v4, p3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 338
    .line 339
    add-int/2addr p1, v4

    .line 340
    if-le p1, p2, :cond_10

    .line 341
    .line 342
    if-nez v2, :cond_d

    .line 343
    .line 344
    iget p1, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 345
    .line 346
    if-le p1, v1, :cond_d

    .line 347
    .line 348
    iput v1, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 349
    .line 350
    goto :goto_5

    .line 351
    :cond_d
    if-eqz v2, :cond_e

    .line 352
    .line 353
    iget p1, v2, Lcom/android/launcher3/widget/U;->g:I

    .line 354
    .line 355
    iput p1, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 356
    .line 357
    :cond_e
    :goto_5
    iget-object p1, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 358
    .line 359
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 360
    .line 361
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 362
    .line 363
    .line 364
    move-result-object p2

    .line 365
    invoke-virtual {p1, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    check-cast p1, Ljava/util/ArrayList;

    .line 370
    .line 371
    if-eqz p1, :cond_f

    .line 372
    .line 373
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    goto :goto_6

    .line 377
    :cond_f
    new-instance p1, Ljava/util/ArrayList;

    .line 378
    .line 379
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 380
    .line 381
    .line 382
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    iget-object p0, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 386
    .line 387
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 388
    .line 389
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 390
    .line 391
    .line 392
    move-result-object p2

    .line 393
    invoke-virtual {p0, p2, p1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    :goto_6
    return v7

    .line 397
    :cond_10
    iget p1, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 398
    .line 399
    iget p2, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 400
    .line 401
    add-int/2addr p1, p2

    .line 402
    if-le p1, v1, :cond_16

    .line 403
    .line 404
    if-nez v2, :cond_13

    .line 405
    .line 406
    if-gt p2, v1, :cond_12

    .line 407
    .line 408
    iget-object p1, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 409
    .line 410
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 411
    .line 412
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 413
    .line 414
    .line 415
    move-result-object p2

    .line 416
    invoke-virtual {p1, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object p1

    .line 420
    check-cast p1, Ljava/util/ArrayList;

    .line 421
    .line 422
    if-eqz p1, :cond_11

    .line 423
    .line 424
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    goto :goto_7

    .line 428
    :cond_11
    new-instance p1, Ljava/util/ArrayList;

    .line 429
    .line 430
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 431
    .line 432
    .line 433
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 434
    .line 435
    .line 436
    iget-object p0, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 437
    .line 438
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 439
    .line 440
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 441
    .line 442
    .line 443
    move-result-object p2

    .line 444
    invoke-virtual {p0, p2, p1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 445
    .line 446
    .line 447
    :goto_7
    return v7

    .line 448
    :cond_12
    iput v1, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 449
    .line 450
    iput v3, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 451
    .line 452
    goto :goto_9

    .line 453
    :cond_13
    if-gt p2, v1, :cond_15

    .line 454
    .line 455
    iget p1, v2, Lcom/android/launcher3/widget/U;->g:I

    .line 456
    .line 457
    iput p1, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 458
    .line 459
    iget-object p1, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 460
    .line 461
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 462
    .line 463
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 464
    .line 465
    .line 466
    move-result-object p2

    .line 467
    invoke-virtual {p1, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 468
    .line 469
    .line 470
    move-result-object p1

    .line 471
    check-cast p1, Ljava/util/ArrayList;

    .line 472
    .line 473
    if-eqz p1, :cond_14

    .line 474
    .line 475
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 476
    .line 477
    .line 478
    goto :goto_8

    .line 479
    :cond_14
    new-instance p1, Ljava/util/ArrayList;

    .line 480
    .line 481
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 482
    .line 483
    .line 484
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 485
    .line 486
    .line 487
    iget-object p0, p0, Lcom/android/launcher3/b0;->a:Landroid/util/ArrayMap;

    .line 488
    .line 489
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 490
    .line 491
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 492
    .line 493
    .line 494
    move-result-object p2

    .line 495
    invoke-virtual {p0, p2, p1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    :goto_8
    return v7

    .line 499
    :cond_15
    iget p1, v2, Lcom/android/launcher3/widget/U;->g:I

    .line 500
    .line 501
    iput p1, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 502
    .line 503
    iput v3, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 504
    .line 505
    :cond_16
    :goto_9
    iget p1, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 506
    .line 507
    iget p2, p3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 508
    .line 509
    iget v1, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 510
    .line 511
    iget v2, p3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 512
    .line 513
    invoke-virtual {p4, p1, p2, v1, v2}, Lcom/android/launcher3/util/t0;->d(IIII)Z

    .line 514
    .line 515
    .line 516
    move-result p1

    .line 517
    if-eqz p1, :cond_17

    .line 518
    .line 519
    invoke-virtual {p4, p3, v7}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 520
    .line 521
    .line 522
    return v7

    .line 523
    :cond_17
    new-instance p1, Ljava/lang/StringBuilder;

    .line 524
    .line 525
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 526
    .line 527
    .line 528
    const-string p2, "Error loading shortcut "

    .line 529
    .line 530
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    .line 532
    .line 533
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    const-string p2, " into cell ("

    .line 537
    .line 538
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 539
    .line 540
    .line 541
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 542
    .line 543
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 544
    .line 545
    .line 546
    const-string p2, "-"

    .line 547
    .line 548
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    .line 550
    .line 551
    iget p2, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 552
    .line 553
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 554
    .line 555
    .line 556
    const-string p2, ":"

    .line 557
    .line 558
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 559
    .line 560
    .line 561
    iget p2, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 562
    .line 563
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    const-string p2, ","

    .line 567
    .line 568
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    iget p4, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 572
    .line 573
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    .line 578
    .line 579
    iget p4, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 580
    .line 581
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 582
    .line 583
    .line 584
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    .line 586
    .line 587
    iget p2, p3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 588
    .line 589
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    const-string p2, ") already occupied"

    .line 593
    .line 594
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object p1

    .line 601
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 602
    .line 603
    .line 604
    iget-boolean p0, p0, Lcom/android/launcher3/b0;->d:Z

    .line 605
    .line 606
    return p0

    .line 607
    :cond_18
    :goto_a
    return v3
.end method
