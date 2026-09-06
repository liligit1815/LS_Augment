.class public final Lcom/android/quickstep/FocusState;
.super Ljava/lang/Object;
.source "FocusState.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/FocusState$Companion;,
        Lcom/android/quickstep/FocusState$FocusChangeListener;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/FocusState$Companion;

.field private static final TAG:Ljava/lang/String; = "FocusState"


# instance fields
.field private focusedDisplayId:I

.field private listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/quickstep/FocusState$FocusChangeListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/FocusState$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/FocusState$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/FocusState;->Companion:Lcom/android/quickstep/FocusState$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/FocusState;->listeners:Ljava/util/Set;

    .line 10
    .line 11
    return-void
.end method

.method public static final synthetic access$setFocusedDisplayId(Lcom/android/quickstep/FocusState;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/FocusState;->setFocusedDisplayId(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final setFocusedDisplayId(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/android/quickstep/FocusState;->focusedDisplayId:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/FocusState;->listeners:Ljava/util/Set;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/quickstep/FocusState$FocusChangeListener;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Lcom/android/quickstep/FocusState$FocusChangeListener;->onFocusedDisplayChanged(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public final addListener(Lcom/android/quickstep/FocusState$FocusChangeListener;)Z
    .locals 1

    .line 1
    const-string v0, "l"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/FocusState;->listeners:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final getFocusedDisplayId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/FocusState;->focusedDisplayId:I

    .line 2
    .line 3
    return p0
.end method

.method public final init(Lcom/android/wm/shell/shared/l;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    :try_start_0
    new-instance v0, Lcom/android/quickstep/FocusState$init$1;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/quickstep/FocusState$init$1;-><init>(Lcom/android/quickstep/FocusState;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, v0}, Lcom/android/wm/shell/shared/l;->a2(Lcom/android/wm/shell/shared/j;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    const-string p1, "FocusState"

    .line 14
    .line 15
    const-string v0, "Failed call setFocusTransitionListener"

    .line 16
    .line 17
    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final removeListener(Lcom/android/quickstep/FocusState$FocusChangeListener;)Z
    .locals 1

    .line 1
    const-string v0, "l"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/FocusState;->listeners:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget p0, p0, Lcom/android/quickstep/FocusState;->focusedDisplayId:I

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "{FocusState focusedDisplayId="

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p0, "}"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
