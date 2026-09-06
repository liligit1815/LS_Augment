.class final Lx3/c$p;
.super Ljava/lang/Object;
.source "MSDLRepositoryImpl.kt"

# interfaces
.implements Lx3/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lx3/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# static fields
.field public static final a:Lx3/c$p;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lx3/c$p;

    .line 2
    .line 3
    invoke-direct {v0}, Lx3/c$p;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx3/c$p;->a:Lx3/c$p;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 6

    .line 1
    new-instance p0, Lw3/b;

    .line 2
    .line 3
    new-instance v0, Lw3/c;

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x2

    .line 9
    invoke-direct {v0, v3, v1, v2}, Lw3/c;-><init>(IFI)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x4

    .line 17
    new-array v1, v1, [J

    .line 18
    .line 19
    fill-array-data v1, :array_0

    .line 20
    .line 21
    .line 22
    const/16 v2, 0x14

    .line 23
    .line 24
    const/16 v3, 0xa

    .line 25
    .line 26
    const/4 v4, 0x5

    .line 27
    const/16 v5, 0x32

    .line 28
    .line 29
    filled-new-array {v4, v5, v2, v3}, [I

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const/4 v3, -0x1

    .line 34
    invoke-static {v1, v2, v3}, Landroid/os/VibrationEffect;->createWaveform([J[II)Landroid/os/VibrationEffect;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "createWaveform(...)"

    .line 39
    .line 40
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, v0, v1}, Lw3/b;-><init>(Ljava/util/List;Landroid/os/VibrationEffect;)V

    .line 44
    .line 45
    .line 46
    return-object p0

    .line 47
    :array_0
    .array-data 8
        0x32
        0x64
        0x64
        0x32
    .end array-data
.end method
