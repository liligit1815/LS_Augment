.class public final Lcom/android/quickstep/HomeVisibilityState;
.super Ljava/lang/Object;
.source "HomeVisibilityState.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/HomeVisibilityState$Companion;,
        Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/HomeVisibilityState$Companion;

.field private static final TAG:Ljava/lang/String; = "HomeVisibilityState"


# instance fields
.field private isHomeVisible:Z

.field private listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private volatile navbarInsetPosition:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/HomeVisibilityState$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/HomeVisibilityState$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/HomeVisibilityState;->Companion:Lcom/android/quickstep/HomeVisibilityState$Companion;

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
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/HomeVisibilityState;->isHomeVisible:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/quickstep/HomeVisibilityState;->listeners:Ljava/util/Set;

    .line 13
    .line 14
    return-void
.end method

.method public static final synthetic access$getListeners$p(Lcom/android/quickstep/HomeVisibilityState;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/HomeVisibilityState;->listeners:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$setHomeVisible$p(Lcom/android/quickstep/HomeVisibilityState;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/HomeVisibilityState;->isHomeVisible:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final addListener(Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;)Z
    .locals 1

    .line 1
    const-string v0, "l"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/HomeVisibilityState;->listeners:Ljava/util/Set;

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

.method public final getNavbarInsetPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/HomeVisibilityState;->navbarInsetPosition:I

    .line 2
    .line 3
    return p0
.end method

.method public final init(Lcom/android/wm/shell/shared/l;)V
    .locals 1

    .line 1
    invoke-static {}, Lf1/a;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    :try_start_0
    new-instance v0, Lcom/android/quickstep/HomeVisibilityState$init$1;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/android/quickstep/HomeVisibilityState$init$1;-><init>(Lcom/android/quickstep/HomeVisibilityState;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, v0}, Lcom/android/wm/shell/shared/l;->Z(Lcom/android/wm/shell/shared/k;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    const-string p1, "HomeVisibilityState"

    .line 21
    .line 22
    const-string v0, "Failed call setHomeTransitionListener"

    .line 23
    .line 24
    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public final isHomeVisible()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/HomeVisibilityState;->isHomeVisible:Z

    .line 2
    .line 3
    return p0
.end method

.method public final removeListener(Lcom/android/quickstep/HomeVisibilityState$VisibilityChangeListener;)Z
    .locals 1

    .line 1
    const-string v0, "l"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/HomeVisibilityState;->listeners:Ljava/util/Set;

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

.method public final setNavbarInsetPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/HomeVisibilityState;->navbarInsetPosition:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/HomeVisibilityState;->isHomeVisible:Z

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "{HomeVisibilityState isHomeVisible="

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

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
