.class final Lx3/c$q;
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
.field public static final a:Lx3/c$q;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lx3/c$q;

    .line 2
    .line 3
    invoke-direct {v0}, Lx3/c$q;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx3/c$q;->a:Lx3/c$q;

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
    .locals 4

    .line 1
    new-instance p0, Lw3/b;

    .line 2
    .line 3
    new-instance v0, Lw3/c;

    .line 4
    .line 5
    const/4 v1, 0x1

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
    invoke-static {v0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v3}, Landroid/os/VibrationEffect;->createPredefined(I)Landroid/os/VibrationEffect;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "createPredefined(...)"

    .line 21
    .line 22
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, v0, v1}, Lw3/b;-><init>(Ljava/util/List;Landroid/os/VibrationEffect;)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method
