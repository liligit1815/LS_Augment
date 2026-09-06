.class public Lcom/android/launcher3/util/K2;
.super Ljava/lang/Object;
.source "TraceHelper.java"


# static fields
.field public static final FLAG_ALLOW_BINDER_TRACKING:I = 0x1

.field public static final FLAG_IGNORE_BINDERS:I = 0x2

.field public static INSTANCE:Lcom/android/launcher3/util/K2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/K2;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroid/os/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static allowIpcs(Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/util/function/Supplier<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 4
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;)Lcom/android/launcher3/util/a2;

    move-result-object p0

    .line 5
    :try_start_0
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    .line 6
    invoke-interface {p0}, Lcom/android/launcher3/util/a2;->close()V

    :cond_0
    return-object p1

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_1

    .line 7
    :try_start_1
    invoke-interface {p0}, Lcom/android/launcher3/util/a2;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw p1
.end method

.method public static synthetic b(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroid/os/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public allowIpcs(Ljava/lang/String;)Lcom/android/launcher3/util/a2;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    sget-object p0, Ly4/c;->g:Ly4/c$a;

    invoke-virtual {p0}, Ly4/c$a;->b()I

    move-result p0

    .line 2
    invoke-static {p1, p0}, Landroid/os/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 3
    new-instance v0, Lcom/android/launcher3/util/J2;

    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/util/J2;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method

.method public beginAsyncSection(Ljava/lang/String;)Lcom/android/launcher3/util/a2;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    sget-object p0, Ly4/c;->g:Ly4/c$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ly4/c$a;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p1, p0}, Landroid/os/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/util/I2;

    .line 11
    .line 12
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/util/I2;-><init>(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public beginSection(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public endSection()V
    .locals 0

    .line 1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
