.class Lcom/android/launcher3/uioverrides/H$c;
.super Ljava/lang/Object;
.source "QuickstepWidgetHolder.java"

# interfaces
.implements Landroid/appwidget/AppWidgetHost$AppWidgetHostListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/uioverrides/H;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation


# instance fields
.field private final g:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/launcher3/uioverrides/H$d;",
            ">;"
        }
    .end annotation
.end field

.field private final h:I

.field private i:Landroid/widget/RemoteViews;


# direct methods
.method constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/H$c;->g:Ljava/util/Set;

    .line 14
    .line 15
    iput p1, p0, Lcom/android/launcher3/uioverrides/H$c;->h:I

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;Lcom/android/launcher3/uioverrides/H$d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/uioverrides/H$c;->h(Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;Lcom/android/launcher3/uioverrides/H$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/uioverrides/H$c;->i(Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/H$c;->j(Lcom/android/launcher3/uioverrides/H$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/H$c;->g(Lcom/android/launcher3/uioverrides/H$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f(Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/launcher3/uioverrides/H$e<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/uioverrides/K;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/uioverrides/K;-><init>(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic g(Lcom/android/launcher3/uioverrides/H$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/H$c;->g:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic h(Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;Lcom/android/launcher3/uioverrides/H$d;)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/uioverrides/H$c;->h:I

    .line 2
    .line 3
    invoke-interface {p3, p0, p1, p2}, Lcom/android/launcher3/uioverrides/H$d;->a(ILcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic i(Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/H$c;->g:Ljava/util/Set;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/uioverrides/L;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/uioverrides/L;-><init>(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic j(Lcom/android/launcher3/uioverrides/H$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/H$c;->g:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(Lcom/android/launcher3/uioverrides/H$d;)Landroid/widget/RemoteViews;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/uioverrides/I;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/uioverrides/I;-><init>(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$d;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/H$c;->i:Landroid/widget/RemoteViews;

    .line 12
    .line 13
    return-object p0
.end method

.method public k(Lcom/android/launcher3/uioverrides/H$d;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/uioverrides/J;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/uioverrides/J;-><init>(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$d;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onUpdateProviderInfo(Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/H$c;->i:Landroid/widget/RemoteViews;

    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/uioverrides/H;->k0()Lcom/android/launcher3/uioverrides/H$e;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/uioverrides/H$c;->f(Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onViewDataChanged(I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/uioverrides/H;->m0()Lcom/android/launcher3/uioverrides/H$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/uioverrides/H$c;->f(Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public updateAppWidget(Landroid/widget/RemoteViews;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/H$c;->i:Landroid/widget/RemoteViews;

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/uioverrides/H;->l0()Lcom/android/launcher3/uioverrides/H$e;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/H$c;->i:Landroid/widget/RemoteViews;

    .line 8
    .line 9
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/uioverrides/H$c;->f(Lcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
