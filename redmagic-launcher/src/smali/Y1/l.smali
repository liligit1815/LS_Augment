.class public final LY1/l;
.super Ljava/lang/Object;
.source "TaskbarSpecsEvaluator.kt"


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/I1;

.field private final b:LY1/h;

.field private c:LY1/j;

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final e:I

.field private final f:LY1/i;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;LY1/h;II)V
    .locals 1

    .line 1
    const-string v0, "taskbarActivityContext"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskbarFeatureEvaluator"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, LY1/l;->a:Lcom/android/launcher3/taskbar/I1;

    .line 15
    .line 16
    iput-object p2, p0, LY1/l;->b:LY1/h;

    .line 17
    .line 18
    invoke-virtual {p0, p4, p3}, LY1/l;->a(II)LY1/j;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, LY1/l;->c:LY1/j;

    .line 23
    .line 24
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, LY1/l;->d:Ljava/util/List;

    .line 29
    .line 30
    sget-object p1, LY1/k;->a:LY1/k;

    .line 31
    .line 32
    invoke-virtual {p1}, LY1/k;->f()LY1/j;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p3}, LY1/j;->a()I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    iget-object p4, p0, LY1/l;->c:LY1/j;

    .line 41
    .line 42
    invoke-virtual {p4}, LY1/j;->a()I

    .line 43
    .line 44
    .line 45
    move-result p4

    .line 46
    if-le p3, p4, :cond_0

    .line 47
    .line 48
    invoke-virtual {p2}, LY1/h;->c()Z

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    if-nez p3, :cond_0

    .line 53
    .line 54
    invoke-virtual {p1}, LY1/k;->e()LY1/j;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-virtual {p3}, LY1/j;->a()I

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    iget-object p4, p0, LY1/l;->c:LY1/j;

    .line 63
    .line 64
    invoke-virtual {p4}, LY1/j;->a()I

    .line 65
    .line 66
    .line 67
    move-result p4

    .line 68
    sub-int/2addr p3, p4

    .line 69
    div-int/lit8 p3, p3, 0x2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const/4 p3, 0x0

    .line 73
    :goto_0
    iput p3, p0, LY1/l;->e:I

    .line 74
    .line 75
    invoke-virtual {p2}, LY1/h;->g()Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-eqz p2, :cond_1

    .line 80
    .line 81
    invoke-virtual {p1}, LY1/k;->c()LY1/i;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    goto :goto_1

    .line 86
    :cond_1
    invoke-virtual {p1}, LY1/k;->a()LY1/i;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    :goto_1
    iput-object p1, p0, LY1/l;->f:LY1/i;

    .line 91
    .line 92
    return-void
.end method


# virtual methods
.method public final a(II)LY1/j;
    .locals 3

    .line 1
    iget-object v0, p0, LY1/l;->b:LY1/h;

    .line 2
    .line 3
    invoke-virtual {v0}, LY1/h;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, LY1/k;->a:LY1/k;

    .line 10
    .line 11
    invoke-virtual {v0}, LY1/k;->g()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, LY1/m;

    .line 16
    .line 17
    iget-object p0, p0, LY1/l;->b:LY1/h;

    .line 18
    .line 19
    invoke-virtual {p0}, LY1/h;->f()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-direct {v2, p1, p2, p0}, LY1/m;-><init>(IIZ)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, LY1/k;->d()LY1/j;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {v1, v2, p0}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, LY1/j;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    sget-object p0, LY1/k;->a:LY1/k;

    .line 38
    .line 39
    invoke-virtual {p0}, LY1/k;->b()LY1/j;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget-object p0, p0, LY1/l;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, Lcom/android/launcher3/h0;->a2:I

    .line 8
    .line 9
    return p0
.end method

.method public final c()I
    .locals 0

    .line 1
    iget p0, p0, LY1/l;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final d()LY1/j;
    .locals 0

    .line 1
    iget-object p0, p0, LY1/l;->c:LY1/j;

    .line 2
    .line 3
    return-object p0
.end method
