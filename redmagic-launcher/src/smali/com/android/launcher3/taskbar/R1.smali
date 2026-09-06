.class public Lcom/android/launcher3/taskbar/R1;
.super Ljava/lang/Object;
.source "TaskbarControllers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/R1$b;,
        Lcom/android/launcher3/taskbar/R1$a;
    }
.end annotation


# instance fields
.field public final A:Lcom/android/launcher3/taskbar/S1;

.field public final B:LZ1/a;

.field private C:[Lcom/android/launcher3/taskbar/R1$b;

.field private D:[Lcom/android/launcher3/taskbar/R1$a;

.field public E:Lcom/android/launcher3/taskbar/o4;

.field private F:Z

.field private final G:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private H:Lcom/android/launcher3/taskbar/J3;

.field private final I:Lcom/android/launcher3/anim/d;

.field public final a:Lcom/android/launcher3/taskbar/I1;

.field public final b:Lcom/android/launcher3/taskbar/j2;

.field public final c:Lcom/android/launcher3/taskbar/l3;

.field public final d:Lcom/android/launcher3/taskbar/M0;

.field public final e:Lcom/android/systemui/shared/rotation/RotationButtonController;

.field public final f:Lcom/android/launcher3/taskbar/s2;

.field public final g:Lcom/android/launcher3/taskbar/I3;

.field public final h:Lcom/android/launcher3/taskbar/W4;

.field public final i:Lcom/android/launcher3/taskbar/q4;

.field public final j:Lcom/android/launcher3/taskbar/O2;

.field public final k:Lcom/android/launcher3/taskbar/U0;

.field public final l:Lcom/android/launcher3/taskbar/a4;

.field public final m:Lcom/android/launcher3/taskbar/K1;

.field public final n:Lcom/android/launcher3/taskbar/z3;

.field public final o:Lcom/android/launcher3/taskbar/H2;

.field public final p:Lcom/android/launcher3/taskbar/allapps/c;

.field public final q:Lcom/android/launcher3/taskbar/N2;

.field public final r:Lcom/android/launcher3/taskbar/c5;

.field public final s:Lcom/android/launcher3/taskbar/F3;

.field public final t:Lcom/android/launcher3/taskbar/j4;

.field public final u:Lcom/android/launcher3/taskbar/M3;

.field public final v:La2/e;

.field public final w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

.field public final x:Lcom/android/launcher3/taskbar/s;

.field public final y:Lcom/android/launcher3/taskbar/q3;

.field public final z:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Lcom/android/launcher3/taskbar/bubbles/m0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/taskbar/l3;Lcom/android/launcher3/taskbar/M0;Lcom/android/systemui/shared/rotation/RotationButtonController;Lcom/android/launcher3/taskbar/s2;Lcom/android/launcher3/taskbar/W4;Lcom/android/launcher3/taskbar/I3;Lcom/android/launcher3/taskbar/q4;Lcom/android/launcher3/taskbar/O2;Lcom/android/launcher3/taskbar/U0;Lcom/android/launcher3/taskbar/a4;Lcom/android/launcher3/taskbar/K1;Lcom/android/launcher3/taskbar/z3;Lcom/android/launcher3/taskbar/H2;La2/e;Lcom/android/launcher3/taskbar/allapps/c;Lcom/android/launcher3/taskbar/N2;Lcom/android/launcher3/taskbar/c5;Lcom/android/launcher3/taskbar/j4;Lcom/android/launcher3/taskbar/M3;Lcom/android/launcher3/taskbar/F3;Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;Lcom/android/launcher3/taskbar/s;Lcom/android/launcher3/taskbar/q3;Ljava/util/Optional;Lcom/android/launcher3/taskbar/S1;LZ1/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/taskbar/I1;",
            "Lcom/android/launcher3/taskbar/j2;",
            "Lcom/android/launcher3/taskbar/l3;",
            "Lcom/android/launcher3/taskbar/M0;",
            "Lcom/android/systemui/shared/rotation/RotationButtonController;",
            "Lcom/android/launcher3/taskbar/s2;",
            "Lcom/android/launcher3/taskbar/W4;",
            "Lcom/android/launcher3/taskbar/I3;",
            "Lcom/android/launcher3/taskbar/q4;",
            "Lcom/android/launcher3/taskbar/O2;",
            "Lcom/android/launcher3/taskbar/U0;",
            "Lcom/android/launcher3/taskbar/a4;",
            "Lcom/android/launcher3/taskbar/K1;",
            "Lcom/android/launcher3/taskbar/z3;",
            "Lcom/android/launcher3/taskbar/H2;",
            "La2/e;",
            "Lcom/android/launcher3/taskbar/allapps/c;",
            "Lcom/android/launcher3/taskbar/N2;",
            "Lcom/android/launcher3/taskbar/c5;",
            "Lcom/android/launcher3/taskbar/j4;",
            "Lcom/android/launcher3/taskbar/M3;",
            "Lcom/android/launcher3/taskbar/F3;",
            "Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;",
            "Lcom/android/launcher3/taskbar/s;",
            "Lcom/android/launcher3/taskbar/q3;",
            "Ljava/util/Optional<",
            "Lcom/android/launcher3/taskbar/bubbles/m0;",
            ">;",
            "Lcom/android/launcher3/taskbar/S1;",
            "LZ1/a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/R1;->C:[Lcom/android/launcher3/taskbar/R1$b;

    .line 3
    iput-object v0, p0, Lcom/android/launcher3/taskbar/R1;->D:[Lcom/android/launcher3/taskbar/R1$a;

    .line 4
    sget-object v1, Lcom/android/launcher3/taskbar/o4;->i:Lcom/android/launcher3/taskbar/o4;

    iput-object v1, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/taskbar/R1;->G:Ljava/util/List;

    .line 6
    iput-object v0, p0, Lcom/android/launcher3/taskbar/R1;->H:Lcom/android/launcher3/taskbar/J3;

    .line 7
    new-instance v0, Lcom/android/launcher3/anim/d;

    new-instance v1, Lcom/android/launcher3/taskbar/P1;

    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/P1;-><init>(Lcom/android/launcher3/taskbar/R1;)V

    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/android/launcher3/taskbar/R1;->I:Lcom/android/launcher3/anim/d;

    .line 8
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 9
    iput-object p2, p0, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 10
    iput-object p3, p0, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 11
    iput-object p4, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 12
    iput-object p5, p0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 13
    iput-object p6, p0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 14
    iput-object p7, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 15
    iput-object p8, p0, Lcom/android/launcher3/taskbar/R1;->g:Lcom/android/launcher3/taskbar/I3;

    .line 16
    iput-object p9, p0, Lcom/android/launcher3/taskbar/R1;->i:Lcom/android/launcher3/taskbar/q4;

    .line 17
    iput-object p10, p0, Lcom/android/launcher3/taskbar/R1;->j:Lcom/android/launcher3/taskbar/O2;

    .line 18
    iput-object p11, p0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 19
    iput-object p12, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 20
    iput-object p13, p0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    move-object/from16 p1, p14

    .line 21
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    move-object/from16 p1, p15

    .line 22
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->o:Lcom/android/launcher3/taskbar/H2;

    move-object/from16 p1, p16

    .line 23
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    move-object/from16 p1, p17

    .line 24
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    move-object/from16 p1, p18

    .line 25
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    move-object/from16 p1, p19

    .line 26
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->r:Lcom/android/launcher3/taskbar/c5;

    move-object/from16 p1, p20

    .line 27
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->t:Lcom/android/launcher3/taskbar/j4;

    move-object/from16 p1, p21

    .line 28
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->u:Lcom/android/launcher3/taskbar/M3;

    move-object/from16 p1, p22

    .line 29
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->s:Lcom/android/launcher3/taskbar/F3;

    move-object/from16 p1, p23

    .line 30
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    move-object/from16 p1, p24

    .line 31
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    move-object/from16 p1, p25

    .line 32
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->y:Lcom/android/launcher3/taskbar/q3;

    move-object/from16 p1, p26

    .line 33
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    move-object/from16 p1, p27

    .line 34
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    move-object/from16 p1, p28

    .line 35
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->B:LZ1/a;

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/R1;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/J3;Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/R1;->k(Lcom/android/launcher3/taskbar/J3;Lcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/R1;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/R1;->l(Lcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/m0;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic k(Lcom/android/launcher3/taskbar/J3;Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p1, p0}, Lcom/android/launcher3/taskbar/bubbles/m0;->e(Lcom/android/launcher3/taskbar/J3;Lcom/android/launcher3/taskbar/R1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic l(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->E0()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v1}, Lcom/android/launcher3/taskbar/o4;->f(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/o4;->b(LN2/h;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic m()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/o4;->b(LN2/h;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private s()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->D:[Lcom/android/launcher3/taskbar/R1$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    array-length v1, v0

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_1

    .line 9
    .line 10
    aget-object v3, v0, v2

    .line 11
    .line 12
    iget-object v4, p0, Lcom/android/launcher3/taskbar/R1;->I:Lcom/android/launcher3/anim/d;

    .line 13
    .line 14
    iget v4, v4, Lcom/android/launcher3/anim/d;->d:F

    .line 15
    .line 16
    invoke-interface {v3, v4}, Lcom/android/launcher3/taskbar/R1$a;->b(F)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method protected f(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "TaskbarControllers:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->C:[Lcom/android/launcher3/taskbar/R1$b;

    .line 22
    .line 23
    const-string v1, "%s\t%s"

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    const-string p0, "All taskbar controllers have already been destroyed."

    .line 28
    .line 29
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/R1;->F:Z

    .line 42
    .line 43
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v2, "%s\tmAreAllControllersInitialized=%b"

    .line 52
    .line 53
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->C:[Lcom/android/launcher3/taskbar/R1$b;

    .line 61
    .line 62
    array-length v2, v0

    .line 63
    const/4 v3, 0x0

    .line 64
    :goto_0
    const-string v4, "\t"

    .line 65
    .line 66
    if-ge v3, v2, :cond_1

    .line 67
    .line 68
    aget-object v5, v0, v3

    .line 69
    .line 70
    new-instance v6, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-interface {v5, v4, p2}, Lcom/android/launcher3/taskbar/R1$b;->a(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 v3, v3, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 92
    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v0, v2, p2}, Lcom/android/launcher3/taskbar/o4;->g(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 112
    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v0, v2, p2}, Lcom/android/systemui/shared/rotation/RotationButtonController;->dumpLogs(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_2

    .line 138
    .line 139
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 140
    .line 141
    invoke-virtual {p0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 146
    .line 147
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/bubbles/m0;->d(Ljava/io/PrintWriter;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_2
    const-string p0, "Bubble controllers are empty."

    .line 152
    .line 153
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public g()Lcom/android/launcher3/taskbar/J3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->H:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    return-object p0
.end method

.method h()Lcom/android/launcher3/taskbar/I1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->I:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Lcom/android/launcher3/taskbar/J3;Landroid/animation/AnimatorSet;)V
    .locals 23

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
    const/4 v3, 0x0

    .line 8
    iput-boolean v3, v0, Lcom/android/launcher3/taskbar/R1;->F:Z

    .line 9
    .line 10
    iput-object v1, v0, Lcom/android/launcher3/taskbar/R1;->H:Lcom/android/launcher3/taskbar/J3;

    .line 11
    .line 12
    iget-object v4, v0, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 13
    .line 14
    invoke-virtual {v4, v0}, Lcom/android/launcher3/taskbar/j2;->l0(Lcom/android/launcher3/taskbar/R1;)V

    .line 15
    .line 16
    .line 17
    iget-object v4, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 18
    .line 19
    invoke-virtual {v4, v0}, Lcom/android/launcher3/taskbar/M0;->m0(Lcom/android/launcher3/taskbar/R1;)V

    .line 20
    .line 21
    .line 22
    iget-object v4, v0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 23
    .line 24
    invoke-virtual {v4}, Lcom/android/systemui/shared/rotation/RotationButtonController;->init()V

    .line 25
    .line 26
    .line 27
    iget-object v4, v0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 28
    .line 29
    invoke-virtual {v4, v0, v2}, Lcom/android/launcher3/taskbar/s2;->w(Lcom/android/launcher3/taskbar/R1;Landroid/animation/AnimatorSet;)V

    .line 30
    .line 31
    .line 32
    iget-object v4, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 33
    .line 34
    invoke-virtual {v4, v0, v2}, Lcom/android/launcher3/taskbar/W4;->d0(Lcom/android/launcher3/taskbar/R1;Landroid/animation/AnimatorSet;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->g:Lcom/android/launcher3/taskbar/I3;

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Lcom/android/launcher3/taskbar/I3;->f(Lcom/android/launcher3/taskbar/R1;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->i:Lcom/android/launcher3/taskbar/q4;

    .line 43
    .line 44
    invoke-virtual {v2, v0}, Lcom/android/launcher3/taskbar/q4;->f(Lcom/android/launcher3/taskbar/R1;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->j:Lcom/android/launcher3/taskbar/O2;

    .line 48
    .line 49
    iget-object v4, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 50
    .line 51
    invoke-virtual {v2, v4}, Lcom/android/launcher3/taskbar/O2;->b(Lcom/android/launcher3/taskbar/M0;)V

    .line 52
    .line 53
    .line 54
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->u:Lcom/android/launcher3/taskbar/M3;

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Lcom/android/launcher3/taskbar/M3;->e(Lcom/android/launcher3/taskbar/R1;)V

    .line 57
    .line 58
    .line 59
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 60
    .line 61
    invoke-virtual {v2, v0}, Lcom/android/launcher3/taskbar/U0;->o(Lcom/android/launcher3/taskbar/R1;)V

    .line 62
    .line 63
    .line 64
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 65
    .line 66
    iget-boolean v4, v1, Lcom/android/launcher3/taskbar/J3;->l:Z

    .line 67
    .line 68
    iget-object v5, v0, Lcom/android/launcher3/taskbar/R1;->H:Lcom/android/launcher3/taskbar/J3;

    .line 69
    .line 70
    invoke-virtual {v2, v0, v4, v5}, Lcom/android/launcher3/taskbar/a4;->Z(Lcom/android/launcher3/taskbar/R1;ZLcom/android/launcher3/taskbar/J3;)V

    .line 71
    .line 72
    .line 73
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 74
    .line 75
    invoke-virtual {v2, v0}, Lcom/android/launcher3/taskbar/z3;->r(Lcom/android/launcher3/taskbar/R1;)V

    .line 76
    .line 77
    .line 78
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->o:Lcom/android/launcher3/taskbar/H2;

    .line 79
    .line 80
    invoke-virtual {v2, v0}, Lcom/android/launcher3/taskbar/H2;->g(Lcom/android/launcher3/taskbar/R1;)V

    .line 81
    .line 82
    .line 83
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 84
    .line 85
    invoke-virtual {v2, v0}, La2/e;->n(Lcom/android/launcher3/taskbar/R1;)V

    .line 86
    .line 87
    .line 88
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 89
    .line 90
    iget-boolean v4, v1, Lcom/android/launcher3/taskbar/J3;->n:Z

    .line 91
    .line 92
    invoke-virtual {v2, v0, v4}, Lcom/android/launcher3/taskbar/allapps/c;->g(Lcom/android/launcher3/taskbar/R1;Z)V

    .line 93
    .line 94
    .line 95
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 96
    .line 97
    invoke-virtual {v2, v0}, Lcom/android/launcher3/taskbar/l3;->h(Lcom/android/launcher3/taskbar/R1;)V

    .line 98
    .line 99
    .line 100
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 101
    .line 102
    new-instance v4, Lcom/android/launcher3/taskbar/M1;

    .line 103
    .line 104
    invoke-direct {v4, v0, v1}, Lcom/android/launcher3/taskbar/M1;-><init>(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/J3;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2, v4}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 108
    .line 109
    .line 110
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 111
    .line 112
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/N2;->l(Lcom/android/launcher3/taskbar/R1;)V

    .line 113
    .line 114
    .line 115
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->r:Lcom/android/launcher3/taskbar/c5;

    .line 116
    .line 117
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/c5;->j(Lcom/android/launcher3/taskbar/R1;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->s:Lcom/android/launcher3/taskbar/F3;

    .line 121
    .line 122
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/F3;->t(Lcom/android/launcher3/taskbar/R1;)V

    .line 123
    .line 124
    .line 125
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->t:Lcom/android/launcher3/taskbar/j4;

    .line 126
    .line 127
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/j4;->q(Lcom/android/launcher3/taskbar/R1;)V

    .line 128
    .line 129
    .line 130
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->o(Lcom/android/launcher3/taskbar/R1;)V

    .line 133
    .line 134
    .line 135
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 136
    .line 137
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/s;->v(Lcom/android/launcher3/taskbar/R1;)V

    .line 138
    .line 139
    .line 140
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->y:Lcom/android/launcher3/taskbar/q3;

    .line 141
    .line 142
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->H:Lcom/android/launcher3/taskbar/J3;

    .line 143
    .line 144
    invoke-virtual {v1, v0, v2}, Lcom/android/launcher3/taskbar/q3;->i(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/J3;)V

    .line 145
    .line 146
    .line 147
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 148
    .line 149
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->H:Lcom/android/launcher3/taskbar/J3;

    .line 150
    .line 151
    invoke-virtual {v1, v0, v2}, Lcom/android/launcher3/taskbar/S1;->b(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/J3;)V

    .line 152
    .line 153
    .line 154
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->B:LZ1/a;

    .line 155
    .line 156
    invoke-virtual {v1, v0}, LZ1/a;->b(Lcom/android/launcher3/taskbar/R1;)V

    .line 157
    .line 158
    .line 159
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 160
    .line 161
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 162
    .line 163
    iget-object v4, v0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 164
    .line 165
    iget-object v5, v0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 166
    .line 167
    iget-object v6, v0, Lcom/android/launcher3/taskbar/R1;->g:Lcom/android/launcher3/taskbar/I3;

    .line 168
    .line 169
    iget-object v7, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 170
    .line 171
    iget-object v8, v0, Lcom/android/launcher3/taskbar/R1;->i:Lcom/android/launcher3/taskbar/q4;

    .line 172
    .line 173
    iget-object v9, v0, Lcom/android/launcher3/taskbar/R1;->j:Lcom/android/launcher3/taskbar/O2;

    .line 174
    .line 175
    iget-object v10, v0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 176
    .line 177
    iget-object v11, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 178
    .line 179
    iget-object v12, v0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 180
    .line 181
    iget-object v13, v0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 182
    .line 183
    iget-object v14, v0, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 184
    .line 185
    iget-object v15, v0, Lcom/android/launcher3/taskbar/R1;->r:Lcom/android/launcher3/taskbar/c5;

    .line 186
    .line 187
    move/from16 v16, v3

    .line 188
    .line 189
    iget-object v3, v0, Lcom/android/launcher3/taskbar/R1;->s:Lcom/android/launcher3/taskbar/F3;

    .line 190
    .line 191
    move-object/from16 p1, v1

    .line 192
    .line 193
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->t:Lcom/android/launcher3/taskbar/j4;

    .line 194
    .line 195
    move-object/from16 p2, v1

    .line 196
    .line 197
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->w:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 198
    .line 199
    move-object/from16 v17, v1

    .line 200
    .line 201
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 202
    .line 203
    move-object/from16 v18, v1

    .line 204
    .line 205
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->y:Lcom/android/launcher3/taskbar/q3;

    .line 206
    .line 207
    move-object/from16 v19, v1

    .line 208
    .line 209
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->B:LZ1/a;

    .line 210
    .line 211
    move-object/from16 v20, v1

    .line 212
    .line 213
    const/16 v1, 0x14

    .line 214
    .line 215
    new-array v1, v1, [Lcom/android/launcher3/taskbar/R1$b;

    .line 216
    .line 217
    aput-object p1, v1, v16

    .line 218
    .line 219
    const/16 v21, 0x1

    .line 220
    .line 221
    aput-object v2, v1, v21

    .line 222
    .line 223
    const/4 v2, 0x2

    .line 224
    aput-object v4, v1, v2

    .line 225
    .line 226
    const/4 v4, 0x3

    .line 227
    aput-object v5, v1, v4

    .line 228
    .line 229
    const/16 v22, 0x4

    .line 230
    .line 231
    aput-object v6, v1, v22

    .line 232
    .line 233
    const/16 v22, 0x5

    .line 234
    .line 235
    aput-object v7, v1, v22

    .line 236
    .line 237
    const/4 v7, 0x6

    .line 238
    aput-object v8, v1, v7

    .line 239
    .line 240
    const/4 v7, 0x7

    .line 241
    aput-object v9, v1, v7

    .line 242
    .line 243
    const/16 v7, 0x8

    .line 244
    .line 245
    aput-object v10, v1, v7

    .line 246
    .line 247
    const/16 v7, 0x9

    .line 248
    .line 249
    aput-object v11, v1, v7

    .line 250
    .line 251
    const/16 v7, 0xa

    .line 252
    .line 253
    aput-object v12, v1, v7

    .line 254
    .line 255
    const/16 v7, 0xb

    .line 256
    .line 257
    aput-object v13, v1, v7

    .line 258
    .line 259
    const/16 v7, 0xc

    .line 260
    .line 261
    aput-object v14, v1, v7

    .line 262
    .line 263
    const/16 v7, 0xd

    .line 264
    .line 265
    aput-object v15, v1, v7

    .line 266
    .line 267
    const/16 v7, 0xe

    .line 268
    .line 269
    aput-object v3, v1, v7

    .line 270
    .line 271
    const/16 v3, 0xf

    .line 272
    .line 273
    aput-object p2, v1, v3

    .line 274
    .line 275
    const/16 v3, 0x10

    .line 276
    .line 277
    aput-object v17, v1, v3

    .line 278
    .line 279
    const/16 v3, 0x11

    .line 280
    .line 281
    aput-object v18, v1, v3

    .line 282
    .line 283
    const/16 v3, 0x12

    .line 284
    .line 285
    aput-object v19, v1, v3

    .line 286
    .line 287
    const/16 v3, 0x13

    .line 288
    .line 289
    aput-object v20, v1, v3

    .line 290
    .line 291
    iput-object v1, v0, Lcom/android/launcher3/taskbar/R1;->C:[Lcom/android/launcher3/taskbar/R1$b;

    .line 292
    .line 293
    new-array v1, v4, [Lcom/android/launcher3/taskbar/R1$a;

    .line 294
    .line 295
    aput-object v5, v1, v16

    .line 296
    .line 297
    aput-object v6, v1, v21

    .line 298
    .line 299
    aput-object v15, v1, v2

    .line 300
    .line 301
    iput-object v1, v0, Lcom/android/launcher3/taskbar/R1;->D:[Lcom/android/launcher3/taskbar/R1$a;

    .line 302
    .line 303
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 304
    .line 305
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 306
    .line 307
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    invoke-virtual {v1, v2}, Lcom/android/launcher3/taskbar/S1;->d(I)Z

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    if-nez v1, :cond_1

    .line 316
    .line 317
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 318
    .line 319
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->e1()Z

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    if-nez v1, :cond_0

    .line 324
    .line 325
    goto :goto_0

    .line 326
    :cond_0
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->I:Lcom/android/launcher3/anim/d;

    .line 327
    .line 328
    const/high16 v2, 0x3f800000    # 1.0f

    .line 329
    .line 330
    iput v2, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 331
    .line 332
    goto :goto_1

    .line 333
    :cond_1
    :goto_0
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->I:Lcom/android/launcher3/anim/d;

    .line 334
    .line 335
    iget-object v2, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 336
    .line 337
    iget-object v3, v0, Lcom/android/launcher3/taskbar/R1;->H:Lcom/android/launcher3/taskbar/J3;

    .line 338
    .line 339
    iget-boolean v3, v3, Lcom/android/launcher3/taskbar/J3;->x:Z

    .line 340
    .line 341
    invoke-virtual {v2, v3}, Lcom/android/launcher3/taskbar/S1;->a(Z)F

    .line 342
    .line 343
    .line 344
    move-result v2

    .line 345
    iput v2, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 346
    .line 347
    :goto_1
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/R1;->s()V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/R1;->p()V

    .line 351
    .line 352
    .line 353
    return-void
.end method

.method public n(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/M0;->G0(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/s2;->y()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/s;->D(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public o()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/R1;->F:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/taskbar/R1;->H:Lcom/android/launcher3/taskbar/J3;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/j2;->w0()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/M0;->I0()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/o4;->C()V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/android/systemui/shared/rotation/RotationButtonController;->onDestroy()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/s2;->z()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->i:Lcom/android/launcher3/taskbar/q4;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/q4;->h()V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/W4;->l0()V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/U0;->r()V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/K1;->f()V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/z3;->w()V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->o:Lcom/android/launcher3/taskbar/H2;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/H2;->i()V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 63
    .line 64
    invoke-virtual {v1}, La2/e;->r()V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/allapps/c;->i()V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/l3;->o()V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/N2;->n()V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->r:Lcom/android/launcher3/taskbar/c5;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/c5;->p()V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->s:Lcom/android/launcher3/taskbar/F3;

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/F3;->v()V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/s;->E()V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/a4;->w0()V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 103
    .line 104
    new-instance v2, Lcom/android/launcher3/taskbar/Q1;

    .line 105
    .line 106
    invoke-direct {v2}, Lcom/android/launcher3/taskbar/Q1;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, v2}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/S1;->e()V

    .line 115
    .line 116
    .line 117
    iput-object v0, p0, Lcom/android/launcher3/taskbar/R1;->C:[Lcom/android/launcher3/taskbar/R1$b;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/android/launcher3/taskbar/R1;->D:[Lcom/android/launcher3/taskbar/R1$a;

    .line 120
    .line 121
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/R1;->F:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->G:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->G:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public q(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/R1;->F:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->G:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public r(Lcom/android/launcher3/taskbar/o4;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->C()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/o4;->p(Lcom/android/launcher3/taskbar/R1;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/R1;->H:Lcom/android/launcher3/taskbar/J3;

    .line 14
    .line 15
    iget-wide v0, v0, Lcom/android/launcher3/taskbar/J3;->b:J

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/taskbar/o4;->T(J)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 21
    .line 22
    new-instance v0, Lcom/android/launcher3/taskbar/N1;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/N1;-><init>(Lcom/android/launcher3/taskbar/R1;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Lcom/android/launcher3/taskbar/O1;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/O1;-><init>(Lcom/android/launcher3/taskbar/R1;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0, v1}, LR0/a;->a(Ljava/util/Optional;Ljava/util/function/Consumer;Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->L0()V

    .line 38
    .line 39
    .line 40
    return-void
.end method
