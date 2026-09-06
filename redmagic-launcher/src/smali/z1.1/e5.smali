.class public Lz1/e5;
.super Ljava/lang/Object;
.source "WidgetPredictionsRequester.java"

# interfaces
.implements Landroid/app/prediction/AppPredictor$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/e5$a;
    }
.end annotation


# instance fields
.field private a:Landroid/app/prediction/AppPredictor;

.field private final b:Landroid/content/Context;

.field private final c:Ljava/lang/String;

.field private d:Z

.field private e:Lz1/e5$a;

.field f:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Lz1/Z4;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lz1/e5;->e:Lz1/e5$a;

    .line 6
    .line 7
    iput-object v0, p0, Lz1/e5;->f:Ljava/util/function/Predicate;

    .line 8
    .line 9
    iput-object p1, p0, Lz1/e5;->b:Landroid/content/Context;

    .line 10
    .line 11
    iput-object p2, p0, Lz1/e5;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lz1/e5;->g:Ljava/util/Map;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Lz1/e5;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/e5;->j(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/util/Set;Lz1/Z4;)Z
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public static synthetic c(Lz1/e5;Lcom/android/launcher3/widget/picker/e;Lz1/Z4;)Lcom/android/launcher3/widget/z0;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/e5;->i(Lcom/android/launcher3/widget/picker/e;Lz1/Z4;)Lcom/android/launcher3/widget/z0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/util/E;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    iget-object v1, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method private static e(Landroid/appwidget/AppWidgetProviderInfo;Landroid/content/ComponentName;)Landroid/app/prediction/AppTargetEvent;
    .locals 3

    .line 1
    new-instance v0, Landroid/app/prediction/AppTargetId;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "widget:"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1}, Landroid/app/prediction/AppTargetId;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Landroid/app/prediction/AppTarget$Builder;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-direct {v1, v0, v2, p0}, Landroid/app/prediction/AppTarget$Builder;-><init>(Landroid/app/prediction/AppTargetId;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v1, p0}, Landroid/app/prediction/AppTarget$Builder;->setClassName(Ljava/lang/String;)Landroid/app/prediction/AppTarget$Builder;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Landroid/app/prediction/AppTarget$Builder;->build()Landroid/app/prediction/AppTarget;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance p1, Landroid/app/prediction/AppTargetEvent$Builder;

    .line 53
    .line 54
    const/4 v0, 0x3

    .line 55
    invoke-direct {p1, p0, v0}, Landroid/app/prediction/AppTargetEvent$Builder;-><init>(Landroid/app/prediction/AppTarget;I)V

    .line 56
    .line 57
    .line 58
    const-string p0, "workspace/1/[0,0]/[2,2]"

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Landroid/app/prediction/AppTargetEvent$Builder;->setLaunchLocation(Ljava/lang/String;)Landroid/app/prediction/AppTargetEvent$Builder;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Landroid/app/prediction/AppTargetEvent$Builder;->build()Landroid/app/prediction/AppTargetEvent;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method static f(Ljava/util/List;)Landroid/os/Bundle;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/appwidget/AppWidgetProviderInfo;

    .line 26
    .line 27
    iget-object v3, v2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 28
    .line 29
    invoke-static {v2, v3}, Lz1/e5;->e(Landroid/appwidget/AppWidgetProviderInfo;Landroid/content/ComponentName;)Landroid/app/prediction/AppTargetEvent;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p0, "added_app_widgets"

    .line 38
    .line 39
    invoke-virtual {v0, p0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 40
    .line 41
    .line 42
    return-object v0
.end method

.method static h(Ljava/util/List;Ljava/util/Map;Ljava/util/function/Predicate;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/app/prediction/AppTarget;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Lz1/Z4;",
            ">;",
            "Ljava/util/function/Predicate<",
            "Lz1/Z4;",
            ">;)",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/app/prediction/AppTarget;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/app/prediction/AppTarget;->getClassName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_0

    .line 31
    .line 32
    new-instance v3, Lcom/android/launcher3/util/E;

    .line 33
    .line 34
    new-instance v4, Landroid/content/ComponentName;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/app/prediction/AppTarget;->getPackageName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-direct {v4, v5, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/app/prediction/AppTarget;->getUser()Landroid/os/UserHandle;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-direct {v3, v4, v1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lz1/Z4;

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    invoke-interface {p2, v1}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_0

    .line 65
    .line 66
    :cond_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    return-object v0
.end method

.method private synthetic i(Lcom/android/launcher3/widget/picker/e;Lz1/Z4;)Lcom/android/launcher3/widget/z0;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/z0;

    .line 2
    .line 3
    iget-object v1, p2, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 4
    .line 5
    iget-object p0, p0, Lz1/e5;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/widget/picker/e;->b(Landroid/content/Context;Lz1/Z4;)Lcom/android/launcher3/widget/picker/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 p1, -0x6f

    .line 12
    .line 13
    invoke-direct {v0, v1, p1, p0}, Lcom/android/launcher3/widget/z0;-><init>(Lcom/android/launcher3/widget/U;ILcom/android/launcher3/widget/picker/d;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method private synthetic j(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/e5;->e:Lz1/e5$a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lz1/e5$a;->U(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private k(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/picker/e;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/widget/picker/e;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v1, Lz1/d5;

    .line 11
    .line 12
    invoke-direct {v1, p0, v0}, Lz1/d5;-><init>(Lz1/e5;Lcom/android/launcher3/widget/picker/e;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljava/util/List;

    .line 28
    .line 29
    return-object p0
.end method

.method static l(Ljava/util/List;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;)",
            "Ljava/util/function/Predicate<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lz1/b5;

    .line 6
    .line 7
    invoke-direct {v0}, Lz1/b5;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/util/Set;

    .line 23
    .line 24
    new-instance v0, Lz1/c5;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Lz1/c5;-><init>(Ljava/util/Set;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method


# virtual methods
.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/e5;->a:Landroid/app/prediction/AppPredictor;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroid/app/prediction/AppPredictor;->unregisterPredictionUpdates(Landroid/app/prediction/AppPredictor$Callback;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lz1/e5;->a:Landroid/app/prediction/AppPredictor;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/prediction/AppPredictor;->destroy()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lz1/e5;->a:Landroid/app/prediction/AppPredictor;

    .line 15
    .line 16
    :cond_0
    iput-object v1, p0, Lz1/e5;->e:Lz1/e5$a;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lz1/e5;->d:Z

    .line 20
    .line 21
    iput-object v1, p0, Lz1/e5;->f:Ljava/util/function/Predicate;

    .line 22
    .line 23
    return-void
.end method

.method public m(Ljava/util/List;Lz1/e5$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;",
            "Lz1/e5$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lz1/e5;->g()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lz1/e5;->e:Lz1/e5$a;

    .line 5
    .line 6
    invoke-static {p1}, Lz1/e5;->l(Ljava/util/List;)Ljava/util/function/Predicate;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iput-object p2, p0, Lz1/e5;->f:Ljava/util/function/Predicate;

    .line 11
    .line 12
    iget-object p2, p0, Lz1/e5;->b:Landroid/content/Context;

    .line 13
    .line 14
    const-class v0, Landroid/app/prediction/AppPredictionManager;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Landroid/app/prediction/AppPredictionManager;

    .line 21
    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {p1}, Lz1/e5;->f(Ljava/util/List;)Landroid/os/Bundle;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Landroid/app/prediction/AppPredictionContext$Builder;

    .line 30
    .line 31
    iget-object v1, p0, Lz1/e5;->b:Landroid/content/Context;

    .line 32
    .line 33
    invoke-direct {v0, v1}, Landroid/app/prediction/AppPredictionContext$Builder;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lz1/e5;->c:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/app/prediction/AppPredictionContext$Builder;->setUiSurface(Ljava/lang/String;)Landroid/app/prediction/AppPredictionContext$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, p1}, Landroid/app/prediction/AppPredictionContext$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/prediction/AppPredictionContext$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const/16 v0, 0x14

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/app/prediction/AppPredictionContext$Builder;->setPredictedTargetCount(I)Landroid/app/prediction/AppPredictionContext$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Landroid/app/prediction/AppPredictionContext$Builder;->build()Landroid/app/prediction/AppPredictionContext;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p2, p1}, Landroid/app/prediction/AppPredictionManager;->createAppPredictionSession(Landroid/app/prediction/AppPredictionContext;)Landroid/app/prediction/AppPredictor;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lz1/e5;->a:Landroid/app/prediction/AppPredictor;

    .line 61
    .line 62
    sget-object p2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 63
    .line 64
    invoke-virtual {p1, p2, p0}, Landroid/app/prediction/AppPredictor;->registerPredictionUpdates(Ljava/util/concurrent/Executor;Landroid/app/prediction/AppPredictor$Callback;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lz1/e5;->a:Landroid/app/prediction/AppPredictor;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/app/prediction/AppPredictor;->requestPredictionUpdate()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public onTargetsAvailable(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/app/prediction/AppTarget;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/e5;->g:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/e5;->f:Ljava/util/function/Predicate;

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Lz1/e5;->h(Ljava/util/List;Ljava/util/Map;Ljava/util/function/Predicate;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p1}, Lz1/e5;->k(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-boolean v0, p0, Lz1/e5;->d:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lz1/e5;->e:Lz1/e5$a;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lz1/e5;->d:Z

    .line 23
    .line 24
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 25
    .line 26
    new-instance v1, Lz1/a5;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Lz1/a5;-><init>(Lz1/e5;Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
