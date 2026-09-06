.class final Lx3/c$n;
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
.field public static final a:Lx3/c$n;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lx3/c$n;

    .line 2
    .line 3
    invoke-direct {v0}, Lx3/c$n;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx3/c$n;->a:Lx3/c$n;

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
    .locals 5

    .line 1
    new-instance p0, Lw3/b;

    .line 2
    .line 3
    new-instance v0, Lw3/c;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    const/high16 v3, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-direct {v0, v2, v3, v1}, Lw3/c;-><init>(IFI)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Lw3/c;

    .line 13
    .line 14
    const/16 v4, 0x34

    .line 15
    .line 16
    invoke-direct {v1, v2, v3, v4}, Lw3/c;-><init>(IFI)V

    .line 17
    .line 18
    .line 19
    filled-new-array {v0, v1}, [Lw3/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x7

    .line 28
    new-array v2, v1, [J

    .line 29
    .line 30
    fill-array-data v2, :array_0

    .line 31
    .line 32
    .line 33
    new-array v1, v1, [I

    .line 34
    .line 35
    fill-array-data v1, :array_1

    .line 36
    .line 37
    .line 38
    const/4 v3, -0x1

    .line 39
    invoke-static {v2, v1, v3}, Landroid/os/VibrationEffect;->createWaveform([J[II)Landroid/os/VibrationEffect;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "createWaveform(...)"

    .line 44
    .line 45
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0, v0, v1}, Lw3/b;-><init>(Ljava/util/List;Landroid/os/VibrationEffect;)V

    .line 49
    .line 50
    .line 51
    return-object p0

    .line 52
    nop

    .line 53
    :array_0
    .array-data 8
        0xa
        0xa
        0xa
        0x34
        0xa
        0xa
        0xa
    .end array-data

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    :array_1
    .array-data 4
        0xa
        0xff
        0x14
        0x0
        0xa
        0xff
        0x14
    .end array-data
.end method
