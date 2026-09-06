.class public interface abstract Lcom/android/launcher3/logging/h;
.super Ljava/lang/Object;
.source "StartupLatencyLogger.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/logging/h$a;
    }
.end annotation


# static fields
.field public static final a:Lcom/android/launcher3/logging/h$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logging/h$a;->a:Lcom/android/launcher3/logging/h$a;

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/logging/h;->a:Lcom/android/launcher3/logging/h$a;

    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/logging/StatsLogManager$f;)Lcom/android/launcher3/logging/h;
    .locals 1

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b()Lcom/android/launcher3/logging/h;
    .locals 0

    .line 1
    return-object p0
.end method

.method public c(Lcom/android/launcher3/logging/StatsLogManager$f;)Lcom/android/launcher3/logging/h;
    .locals 1

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public d(I)Lcom/android/launcher3/logging/h;
    .locals 0

    .line 1
    return-object p0
.end method

.method public e()Lcom/android/launcher3/logging/h;
    .locals 0

    .line 1
    return-object p0
.end method

.method public abstract reset()V
.end method
