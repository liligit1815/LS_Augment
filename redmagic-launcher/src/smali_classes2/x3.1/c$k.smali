.class final Lx3/c$k;
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
.field public static final a:Lx3/c$k;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lx3/c$k;

    .line 2
    .line 3
    invoke-direct {v0}, Lx3/c$k;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx3/c$k;->a:Lx3/c$k;

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
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x3

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
    const/16 v4, 0x38

    .line 15
    .line 16
    invoke-direct {v1, v2, v3, v4}, Lw3/c;-><init>(IFI)V

    .line 17
    .line 18
    .line 19
    new-instance v5, Lw3/c;

    .line 20
    .line 21
    invoke-direct {v5, v2, v3, v4}, Lw3/c;-><init>(IFI)V

    .line 22
    .line 23
    .line 24
    filled-new-array {v0, v1, v5}, [Lw3/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lx3/c;->d()[J

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {}, Lx3/c;->c()[I

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const/4 v3, -0x1

    .line 41
    invoke-static {v1, v2, v3}, Landroid/os/VibrationEffect;->createWaveform([J[II)Landroid/os/VibrationEffect;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "createWaveform(...)"

    .line 46
    .line 47
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, v0, v1}, Lw3/b;-><init>(Ljava/util/List;Landroid/os/VibrationEffect;)V

    .line 51
    .line 52
    .line 53
    return-object p0
.end method
