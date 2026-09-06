.class public abstract Lcom/android/quickstep/DisplayModel;
.super Ljava/lang/Object;
.source "DisplayModel.kt"

# interfaces
.implements Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/DisplayModel$Companion;,
        Lcom/android/quickstep/DisplayModel$DisplayResource;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<RESOURCE_TYPE:",
        "Lcom/android/quickstep/DisplayModel$DisplayResource;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;"
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/DisplayModel$Companion;

.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "DisplayModel"


# instance fields
.field private final context:Landroid/content/Context;

.field private final displayManager:Landroid/hardware/display/DisplayManager;

.field private final displayResourceArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "TRESOURCE_TYPE;>;"
        }
    .end annotation
.end field

.field private systemDecorationChangeObserver:Lcom/android/quickstep/SystemDecorationChangeObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/DisplayModel$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/DisplayModel$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/DisplayModel;->Companion:Lcom/android/quickstep/DisplayModel$Companion;

    .line 8
    .line 9
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
    iput-object p1, p0, Lcom/android/quickstep/DisplayModel;->context:Landroid/content/Context;

    .line 10
    .line 11
    const-string v0, "display"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "null cannot be cast to non-null type android.hardware.display.DisplayManager"

    .line 18
    .line 19
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    check-cast p1, Landroid/hardware/display/DisplayManager;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/quickstep/DisplayModel;->displayManager:Landroid/hardware/display/DisplayManager;

    .line 25
    .line 26
    new-instance p1, Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/quickstep/DisplayModel;->displayResourceArray:Landroid/util/SparseArray;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method protected abstract createDisplayResource(Landroid/view/Display;)Lcom/android/quickstep/DisplayModel$DisplayResource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Display;",
            ")TRESOURCE_TYPE;"
        }
    .end annotation
.end method

.method public final deleteDisplayResource(I)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->getDisplayResource(I)Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/DisplayModel$DisplayResource;->cleanup()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/DisplayModel;->displayResourceArray:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/DisplayModel;->systemDecorationChangeObserver:Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/quickstep/SystemDecorationChangeObserver;->unregisterDisplayDecorationListener(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/DisplayModel;->systemDecorationChangeObserver:Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/DisplayModel;->displayResourceArray:Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-static {v0}, LI/i;->a(Landroid/util/SparseArray;)Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/quickstep/DisplayModel$DisplayResource;->cleanup()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/DisplayModel;->displayResourceArray:Landroid/util/SparseArray;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    const-string v0, "prefix"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "writer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lkotlin/jvm/internal/D;->b(Ljava/lang/Class;)LB4/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, LB4/c;->d()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v0, ": display resources=["

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/quickstep/DisplayModel;->displayResourceArray:Landroid/util/SparseArray;

    .line 47
    .line 48
    invoke-static {p0}, LI/i;->a(Landroid/util/SparseArray;)Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 63
    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v2, "\t"

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1, p2}, Lcom/android/quickstep/DisplayModel$DisplayResource;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p1, "]"

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final getContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/DisplayModel;->context:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDisplayResource(I)Lcom/android/quickstep/DisplayModel$DisplayResource;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TRESOURCE_TYPE;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/DisplayModel;->displayResourceArray:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 8
    .line 9
    return-object p0
.end method

.method protected final getDisplayResourceArray()Landroid/util/SparseArray;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "TRESOURCE_TYPE;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/DisplayModel;->displayResourceArray:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final initializeDisplays()V
    .locals 6

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
    iget-object v1, p0, Lcom/android/quickstep/DisplayModel;->context:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/quickstep/DisplayModel;->systemDecorationChangeObserver:Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/android/quickstep/SystemDecorationChangeObserver;->registerDisplayDecorationListener(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/DisplayModel;->displayManager:Landroid/hardware/display/DisplayManager;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/hardware/display/DisplayManager;->getDisplays()[Landroid/view/Display;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "getDisplays(...)"

    .line 29
    .line 30
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    array-length v2, v0

    .line 39
    const/4 v3, 0x0

    .line 40
    :goto_0
    if-ge v3, v2, :cond_2

    .line 41
    .line 42
    aget-object v4, v0, v3

    .line 43
    .line 44
    invoke-virtual {v4}, Landroid/view/Display;->getDisplayId()I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    invoke-virtual {p0, v5}, Lcom/android/quickstep/DisplayModel;->getDisplayResource(I)Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    if-nez v5, :cond_1

    .line 53
    .line 54
    invoke-interface {v1, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Landroid/view/Display;

    .line 75
    .line 76
    invoke-virtual {v1}, Landroid/view/Display;->getDisplayId()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {p0, v1}, Lcom/android/quickstep/DisplayModel;->storeDisplayResource(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    return-void
.end method

.method public onDisplayAddSystemDecorations(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->storeDisplayResource(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDisplayRemoveSystemDecorations(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->deleteDisplayResource(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDisplayRemoved(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->deleteDisplayResource(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final storeDisplayResource(I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->getDisplayResource(I)Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/DisplayModel;->displayManager:Landroid/hardware/display/DisplayManager;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/DisplayModel;->displayResourceArray:Landroid/util/SparseArray;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/android/quickstep/DisplayModel;->createDisplayResource(Landroid/view/Display;)Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v1, p1, p0}, Landroid/util/SparseArray;->set(ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
