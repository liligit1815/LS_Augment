.class Lcom/android/quickstep/BinderTracker$TraceHelperExtension;
.super Lcom/android/launcher3/util/K2;
.source "BinderTracker.java"

# interfaces
.implements Landroid/os/Binder$ProxyTransactListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/BinderTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TraceHelperExtension"
.end annotation


# instance fields
.field private final mUnexpectedTransactionCallback:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/BinderTracker$BinderCallSite;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/BinderTracker$BinderCallSite;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/K2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/BinderTracker$TraceHelperExtension;->mUnexpectedTransactionCallback:Ljava/util/function/Consumer;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroid/os/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->d()Ljava/util/LinkedList;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1, p0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroid/os/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->d()Ljava/util/LinkedList;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1, p0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->c()Ljava/util/LinkedList;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private static getActionableStacktrace()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->b()Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "DEBUG_STACKTRACE not turned on."

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    new-instance v0, Ljava/io/StringWriter;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ljava/lang/Throwable;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ljava/io/PrintWriter;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->e()[Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    array-length v2, v1

    .line 41
    const/4 v3, 0x0

    .line 42
    :goto_0
    if-ge v3, v2, :cond_2

    .line 43
    .line 44
    aget-object v4, v1, v3

    .line 45
    .line 46
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_1

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const-string v0, "Not actionable to launcher"

    .line 57
    .line 58
    return-object v0
.end method


# virtual methods
.method public allowIpcs(Ljava/lang/String;)Lcom/android/launcher3/util/a2;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;)Lcom/android/launcher3/util/a2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->d()Ljava/util/LinkedList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->c()Ljava/util/LinkedList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    sget-object p0, Ly4/c;->g:Ly4/c$a;

    .line 27
    .line 28
    invoke-virtual {p0}, Ly4/c$a;->b()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-static {p1, p0}, Landroid/os/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Lcom/android/quickstep/L0;

    .line 36
    .line 37
    invoke-direct {v0, p1, p0}, Lcom/android/quickstep/L0;-><init>(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public beginAsyncSection(Ljava/lang/String;)Lcom/android/launcher3/util/a2;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Lcom/android/launcher3/util/K2;->beginAsyncSection(Ljava/lang/String;)Lcom/android/launcher3/util/a2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->d()Ljava/util/LinkedList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    sget-object p0, Ly4/c;->g:Ly4/c$a;

    .line 20
    .line 21
    invoke-virtual {p0}, Ly4/c$a;->b()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p1, p0}, Landroid/os/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Lcom/android/quickstep/K0;

    .line 29
    .line 30
    invoke-direct {v0, p1, p0}, Lcom/android/quickstep/K0;-><init>(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public beginSection(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->d()Ljava/util/LinkedList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public endSection()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->g()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->d()Ljava/util/LinkedList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/util/LinkedList;->pollLast()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onTransactEnded(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTransactStarted(Landroid/os/IBinder;I)Ljava/lang/Object;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public onTransactStarted(Landroid/os/IBinder;II)Ljava/lang/Object;
    .locals 4

    .line 2
    const-string v0, "BinderTracker"

    invoke-static {}, Lcom/android/quickstep/BinderTracker;->g()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    const/4 v1, 0x1

    and-int/2addr p3, v1

    if-ne p3, v1, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->c()Ljava/util/LinkedList;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/LinkedList;->peekLast()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 4
    :try_start_0
    invoke-interface {p1}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v1

    .line 5
    invoke-static {}, Lcom/android/quickstep/BinderTracker;->f()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_1

    return-object v2

    :catch_0
    move-exception v1

    .line 6
    const-string v3, "Error getting IPC descriptor"

    invoke-static {v0, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    :cond_1
    if-nez p3, :cond_2

    .line 8
    iget-object p0, p0, Lcom/android/quickstep/BinderTracker$TraceHelperExtension;->mUnexpectedTransactionCallback:Ljava/util/function/Consumer;

    new-instance p1, Lcom/android/quickstep/BinderTracker$BinderCallSite;

    invoke-static {}, Lcom/android/quickstep/BinderTracker;->d()Ljava/util/LinkedList;

    move-result-object p3

    .line 9
    invoke-virtual {p3}, Ljava/util/LinkedList;->peekLast()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 10
    invoke-static {}, Lcom/android/quickstep/BinderTracker$TraceHelperExtension;->getActionableStacktrace()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, p3, v1, p2, v0}, Lcom/android/quickstep/BinderTracker$BinderCallSite;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 11
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_0

    .line 12
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "MainThread-IPC "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " ignored due to "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_0
    return-object v2
.end method
