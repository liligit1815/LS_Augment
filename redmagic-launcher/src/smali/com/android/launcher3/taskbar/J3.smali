.class public Lcom/android/launcher3/taskbar/J3;
.super Ljava/lang/Object;
.source "TaskbarSharedState.java"


# static fields
.field private static y:I = 0x0

.field private static z:I = 0x1


# instance fields
.field private final a:Landroid/os/IBinder;

.field public b:J

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:F

.field public i:I

.field public j:I

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:LN2/h;

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LN2/k;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LN2/k;",
            ">;"
        }
    .end annotation
.end field

.field public r:[F

.field public s:Landroid/app/PendingIntent;

.field public final t:[Landroid/view/InsetsFrameProvider;

.field public u:Z

.field private v:Z

.field public w:Z

.field public x:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Binder;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/J3;->a:Landroid/os/IBinder;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Lcom/android/launcher3/taskbar/J3;->j:I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/J3;->k:Z

    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/J3;->l:Z

    .line 18
    .line 19
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/J3;->m:Z

    .line 20
    .line 21
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/J3;->n:Z

    .line 22
    .line 23
    const/4 v3, 0x5

    .line 24
    new-array v3, v3, [F

    .line 25
    .line 26
    iput-object v3, p0, Lcom/android/launcher3/taskbar/J3;->r:[F

    .line 27
    .line 28
    new-instance v3, Landroid/view/InsetsFrameProvider;

    .line 29
    .line 30
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    invoke-direct {v3, v0, v1, v4}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    new-instance v4, Landroid/view/InsetsFrameProvider;

    .line 38
    .line 39
    invoke-static {}, Landroid/view/WindowInsets$Type;->tappableElement()I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    invoke-direct {v4, v0, v1, v5}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    new-instance v5, Landroid/view/InsetsFrameProvider;

    .line 47
    .line 48
    invoke-static {}, Landroid/view/WindowInsets$Type;->mandatorySystemGestures()I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    invoke-direct {v5, v0, v1, v6}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    new-instance v6, Landroid/view/InsetsFrameProvider;

    .line 56
    .line 57
    sget v7, Lcom/android/launcher3/taskbar/J3;->y:I

    .line 58
    .line 59
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    invoke-direct {v6, v0, v7, v8}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v6, v1}, Landroid/view/InsetsFrameProvider;->setSource(I)Landroid/view/InsetsFrameProvider;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    new-instance v7, Landroid/view/InsetsFrameProvider;

    .line 71
    .line 72
    sget v8, Lcom/android/launcher3/taskbar/J3;->z:I

    .line 73
    .line 74
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemGestures()I

    .line 75
    .line 76
    .line 77
    move-result v9

    .line 78
    invoke-direct {v7, v0, v8, v9}, Landroid/view/InsetsFrameProvider;-><init>(Ljava/lang/Object;II)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v7, v1}, Landroid/view/InsetsFrameProvider;->setSource(I)Landroid/view/InsetsFrameProvider;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    filled-new-array {v3, v4, v5, v6, v0}, [Landroid/view/InsetsFrameProvider;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/android/launcher3/taskbar/J3;->t:[Landroid/view/InsetsFrameProvider;

    .line 90
    .line 91
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/J3;->u:Z

    .line 92
    .line 93
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/J3;->v:Z

    .line 94
    .line 95
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/J3;->w:Z

    .line 96
    .line 97
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/J3;->x:Z

    .line 98
    .line 99
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/J3;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/J3;->p:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/J3;->v:Z

    .line 2
    .line 3
    return-void
.end method
