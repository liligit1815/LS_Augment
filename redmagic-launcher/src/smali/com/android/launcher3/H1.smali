.class public abstract Lcom/android/launcher3/H1;
.super Ljava/lang/Object;
.source "LauncherPrefs.kt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract a()Lcom/android/launcher3/r0;
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/H1;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/android/launcher3/W2;->a:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "SHARED_PREFERENCES_KEY"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "com.android.launcher3.device.prefs"

    .line 16
    .line 17
    return-object p0
.end method

.method public abstract c()Ljava/lang/String;
.end method

.method public abstract d()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end method

.method public abstract e()Z
.end method

.method public final f(Ljava/lang/Object;)Lh4/l;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lh4/l<",
            "Lcom/android/launcher3/H1;",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lh4/l;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lh4/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
