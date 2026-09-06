.class final Lx3/c$d;
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
.field public static final a:Lx3/c$d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lx3/c$d;

    .line 2
    .line 3
    invoke-direct {v0}, Lx3/c$d;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx3/c$d;->a:Lx3/c$d;

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
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_0

    .line 10
    .line 11
    new-instance v3, Lw3/c;

    .line 12
    .line 13
    const/16 v4, 0x8

    .line 14
    .line 15
    const v5, 0x3e99999a    # 0.3f

    .line 16
    .line 17
    .line 18
    invoke-direct {v3, v4, v5, v1}, Lw3/c;-><init>(IFI)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x4

    .line 28
    new-array v0, v0, [J

    .line 29
    .line 30
    fill-array-data v0, :array_0

    .line 31
    .line 32
    .line 33
    const/16 v1, 0x1e

    .line 34
    .line 35
    const/16 v2, 0x32

    .line 36
    .line 37
    const/16 v3, 0xa

    .line 38
    .line 39
    filled-new-array {v3, v1, v2, v3}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const/4 v2, -0x1

    .line 44
    invoke-static {v0, v1, v2}, Landroid/os/VibrationEffect;->createWaveform([J[II)Landroid/os/VibrationEffect;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "createWaveform(...)"

    .line 49
    .line 50
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Lw3/b;

    .line 54
    .line 55
    invoke-direct {v1, p0, v0}, Lw3/b;-><init>(Ljava/util/List;Landroid/os/VibrationEffect;)V

    .line 56
    .line 57
    .line 58
    return-object v1

    .line 59
    :array_0
    .array-data 8
        0xa
        0x14
        0x14
        0xa
    .end array-data
.end method
