.class Lcom/android/launcher3/util/Z$d;
.super Ljava/lang/Object;
.source "DisplayController.java"

# interfaces
.implements Landroid/content/ComponentCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/Z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "d"
.end annotation


# instance fields
.field final g:I

.field final h:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/android/launcher3/util/Z$b;",
            ">;"
        }
    .end annotation
.end field

.field final i:Landroid/content/Context;

.field j:Lcom/android/launcher3/util/Z$c;

.field final synthetic k:Lcom/android/launcher3/util/Z;


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/Z;ILandroid/content/Context;Lcom/android/launcher3/util/Z$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/Z$d;->k:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/util/Z$d;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    iput p2, p0, Lcom/android/launcher3/util/Z$d;->g:I

    .line 14
    .line 15
    iput-object p3, p0, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 16
    .line 17
    iput-object p4, p0, Lcom/android/launcher3/util/Z$d;->j:Lcom/android/launcher3/util/Z$c;

    .line 18
    .line 19
    invoke-virtual {p3, p0}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method a(Lcom/android/launcher3/util/Z$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z$d;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/Z$d;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method c(Lcom/android/launcher3/util/Z$c;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z$d;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/util/Z$d;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/android/launcher3/util/Z$b;

    .line 17
    .line 18
    iget-object v3, p0, Lcom/android/launcher3/util/Z$d;->i:Landroid/content/Context;

    .line 19
    .line 20
    invoke-interface {v2, v3, p1, p2}, Lcom/android/launcher3/util/Z$b;->onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method d(Lcom/android/launcher3/util/Z$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z$d;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z$d;->k:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/util/Z$d;->g:I

    .line 4
    .line 5
    invoke-static {v0, p1, p0}, Lcom/android/launcher3/util/Z;->l(Lcom/android/launcher3/util/Z;Landroid/content/res/Configuration;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .line 1
    return-void
.end method
