.class final Lx3/c$o;
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
.field public static final a:Lx3/c$o;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lx3/c$o;

    .line 2
    .line 3
    invoke-direct {v0}, Lx3/c$o;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx3/c$o;->a:Lx3/c$o;

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
    .locals 7

    .line 1
    new-instance p0, Lw3/b;

    .line 2
    .line 3
    new-instance v0, Lw3/c;

    .line 4
    .line 5
    const/4 v1, 0x7

    .line 6
    const/high16 v2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-direct {v0, v1, v2, v3}, Lw3/c;-><init>(IFI)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Lw3/c;

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    const/16 v5, 0x34

    .line 16
    .line 17
    invoke-direct {v1, v4, v2, v5}, Lw3/c;-><init>(IFI)V

    .line 18
    .line 19
    .line 20
    filled-new-array {v0, v1}, [Lw3/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x5

    .line 29
    new-array v1, v1, [J

    .line 30
    .line 31
    fill-array-data v1, :array_0

    .line 32
    .line 33
    .line 34
    const/16 v2, 0xff

    .line 35
    .line 36
    const/16 v4, 0x14

    .line 37
    .line 38
    const/16 v5, 0x64

    .line 39
    .line 40
    const/16 v6, 0xa

    .line 41
    .line 42
    filled-new-array {v5, v3, v6, v2, v4}, [I

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/4 v3, -0x1

    .line 47
    invoke-static {v1, v2, v3}, Landroid/os/VibrationEffect;->createWaveform([J[II)Landroid/os/VibrationEffect;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v2, "createWaveform(...)"

    .line 52
    .line 53
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, v0, v1}, Lw3/b;-><init>(Ljava/util/List;Landroid/os/VibrationEffect;)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    nop

    .line 61
    :array_0
    .array-data 8
        0x5
        0x34
        0xa
        0xa
        0xa
    .end array-data
.end method
