.class public final LX1/c;
.super Ljava/lang/Object;
.source "DeviceProfileDimensionsProviderAdapter.kt"

# interfaces
.implements LX1/b$d;


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/I1;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 1

    .line 1
    const-string v0, "taskbarActivityContext"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LX1/c;->a:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    return-void
.end method

.method private final c()Lcom/android/launcher3/h0;
    .locals 1

    .line 1
    iget-object p0, p0, LX1/c;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getDeviceProfile(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    invoke-direct {p0}, LX1/c;->c()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Lcom/android/launcher3/h0;->t3:I

    .line 6
    .line 7
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    invoke-direct {p0}, LX1/c;->c()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Lcom/android/launcher3/h0;->r3:I

    .line 6
    .line 7
    return p0
.end method
