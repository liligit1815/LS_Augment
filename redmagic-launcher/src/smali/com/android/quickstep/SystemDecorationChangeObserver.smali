.class public final Lcom/android/quickstep/SystemDecorationChangeObserver;
.super Ljava/lang/Object;
.source "SystemDecorationChangeObserver.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/SystemDecorationChangeObserver$Companion;,
        Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/SystemDecorationChangeObserver$Companion;

.field private static final DEBUG:Z = false

.field private static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/SystemDecorationChangeObserver;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "SystemDecorationChangeObserver"


# instance fields
.field private final mDisplayDecorationListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/SystemDecorationChangeObserver$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/SystemDecorationChangeObserver$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/SystemDecorationChangeObserver;->Companion:Lcom/android/quickstep/SystemDecorationChangeObserver$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/K4;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/android/quickstep/K4;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/SystemDecorationChangeObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/SystemDecorationChangeObserver;->mDisplayDecorationListeners:Ljava/util/ArrayList;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/SystemDecorationChangeObserver;->notifyAddSystemDecorations$lambda$0(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getINSTANCE$cp()Lcom/android/launcher3/util/I;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemDecorationChangeObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic b(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/SystemDecorationChangeObserver;->notifyOnDisplayRemoved$lambda$1(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/SystemDecorationChangeObserver;->notifyDisplayRemoveSystemDecorations$lambda$2(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final getINSTANCE()Lcom/android/launcher3/util/I;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/SystemDecorationChangeObserver;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemDecorationChangeObserver;->Companion:Lcom/android/quickstep/SystemDecorationChangeObserver$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/SystemDecorationChangeObserver$Companion;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method private static final notifyAddSystemDecorations$lambda$0(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;->onDisplayAddSystemDecorations(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final notifyDisplayRemoveSystemDecorations$lambda$2(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;->onDisplayRemoveSystemDecorations(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final notifyOnDisplayRemoved$lambda$1(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;->onDisplayRemoved(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final notifyAddSystemDecorations(I)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemDecorationChangeObserver;->mDisplayDecorationListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "iterator(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "next(...)"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    check-cast v0, Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;

    .line 28
    .line 29
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 30
    .line 31
    new-instance v2, Lcom/android/quickstep/L4;

    .line 32
    .line 33
    invoke-direct {v2, v0, p1}, Lcom/android/quickstep/L4;-><init>(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method public final notifyDisplayRemoveSystemDecorations(I)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemDecorationChangeObserver;->mDisplayDecorationListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "iterator(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "next(...)"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    check-cast v0, Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;

    .line 28
    .line 29
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 30
    .line 31
    new-instance v2, Lcom/android/quickstep/N4;

    .line 32
    .line 33
    invoke-direct {v2, v0, p1}, Lcom/android/quickstep/N4;-><init>(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method public final notifyOnDisplayRemoved(I)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemDecorationChangeObserver;->mDisplayDecorationListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "iterator(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "next(...)"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    check-cast v0, Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;

    .line 28
    .line 29
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 30
    .line 31
    new-instance v2, Lcom/android/quickstep/M4;

    .line 32
    .line 33
    invoke-direct {v2, v0, p1}, Lcom/android/quickstep/M4;-><init>(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method public final registerDisplayDecorationListener(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/SystemDecorationChangeObserver;->mDisplayDecorationListeners:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final unregisterDisplayDecorationListener(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/SystemDecorationChangeObserver;->mDisplayDecorationListeners:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
