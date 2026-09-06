.class public LJ1/m;
.super Landroid/widget/BaseAdapter;
.source "PinnedAppsAdapter.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LJ1/m$a;
    }
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

.field private final h:Landroid/view/View$OnClickListener;

.field private final i:Landroid/view/View$OnLongClickListener;

.field private final j:Landroid/content/SharedPreferences;

.field private final k:Lcom/android/launcher3/allapps/D;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/D<",
            "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Lcom/android/launcher3/allapps/N;

.field private final m:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/E;",
            ">;"
        }
    .end annotation
.end field

.field private final n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;Lcom/android/launcher3/allapps/D;Landroid/view/View$OnLongClickListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
            "Lcom/android/launcher3/allapps/D<",
            "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
            ">;",
            "Landroid/view/View$OnLongClickListener;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LJ1/m;->m:Ljava/util/Set;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, LJ1/m;->n:Ljava/util/ArrayList;

    .line 17
    .line 18
    iput-object p1, p0, LJ1/m;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, LJ1/m;->h:Landroid/view/View$OnClickListener;

    .line 25
    .line 26
    iput-object p3, p0, LJ1/m;->i:Landroid/view/View$OnLongClickListener;

    .line 27
    .line 28
    iput-object p2, p0, LJ1/m;->k:Lcom/android/launcher3/allapps/D;

    .line 29
    .line 30
    const-string p3, "pinned_apps"

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p1, p3, v0}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    iput-object p3, p0, LJ1/m;->j:Landroid/content/SharedPreferences;

    .line 38
    .line 39
    new-instance p3, Lcom/android/launcher3/allapps/N;

    .line 40
    .line 41
    invoke-direct {p3, p1}, Lcom/android/launcher3/allapps/N;-><init>(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    iput-object p3, p0, LJ1/m;->l:Lcom/android/launcher3/allapps/N;

    .line 45
    .line 46
    new-instance p1, LJ1/c;

    .line 47
    .line 48
    invoke-direct {p1, p0}, LJ1/c;-><init>(LJ1/m;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, p1}, Lcom/android/launcher3/allapps/D;->h(Lcom/android/launcher3/allapps/D$a;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic a(LJ1/m;Lcom/android/launcher3/util/E;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LJ1/m;->l(Lcom/android/launcher3/util/E;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(LJ1/m;Ljava/lang/String;)Lcom/android/launcher3/util/E;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LJ1/m;->s(Ljava/lang/String;)Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(LJ1/m;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LJ1/m;->r(Ljava/util/Set;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(LJ1/m;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LJ1/m;->q(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(LJ1/m;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LJ1/m;->p(Ljava/util/Set;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(LJ1/m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LJ1/m;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic g(LJ1/m;)Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, LJ1/m;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(LJ1/m;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, LJ1/m;->m:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method private j()V
    .locals 3

    .line 1
    iget-object v0, p0, LJ1/m;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LJ1/m;->m:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, LJ1/m;->k:Lcom/android/launcher3/allapps/D;

    .line 13
    .line 14
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    new-instance v2, LJ1/e;

    .line 18
    .line 19
    invoke-direct {v2, v1}, LJ1/e;-><init>(Lcom/android/launcher3/allapps/D;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, LJ1/f;

    .line 27
    .line 28
    invoke-direct {v1}, LJ1/f;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, LJ1/m;->n:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    new-instance v2, LJ1/g;

    .line 41
    .line 42
    invoke-direct {v2, v1}, LJ1/g;-><init>(Ljava/util/ArrayList;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, LJ1/m;->n:Ljava/util/ArrayList;

    .line 49
    .line 50
    iget-object v1, p0, LJ1/m;->l:Lcom/android/launcher3/allapps/N;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private l(Lcom/android/launcher3/util/E;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "#"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    sget-object v1, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 21
    .line 22
    iget-object p0, p0, LJ1/m;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, LD1/t;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 33
    .line 34
    .line 35
    move-result-wide p0

    .line 36
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method private synthetic p(Ljava/util/Set;)V
    .locals 1

    .line 1
    iget-object v0, p0, LJ1/m;->m:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LJ1/m;->m:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, LJ1/m;->j()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic q(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance p2, LJ1/h;

    .line 12
    .line 13
    invoke-direct {p2, p0}, LJ1/h;-><init>(LJ1/m;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance p2, LJ1/i;

    .line 21
    .line 22
    invoke-direct {p2}, LJ1/i;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Ljava/util/Set;

    .line 38
    .line 39
    sget-object p2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 40
    .line 41
    new-instance v0, LJ1/j;

    .line 42
    .line 43
    invoke-direct {v0, p0, p1}, LJ1/j;-><init>(LJ1/m;Ljava/util/Set;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2, v0}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private synthetic r(Ljava/util/Set;)V
    .locals 2

    .line 1
    iget-object v0, p0, LJ1/m;->j:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p1}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v1, LJ1/b;

    .line 12
    .line 13
    invoke-direct {v1, p0}, LJ1/b;-><init>(LJ1/m;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/util/Set;

    .line 29
    .line 30
    const-string p1, "pinned_apps"

    .line 31
    .line 32
    invoke-interface {v0, p1, p0}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private s(Ljava/lang/String;)Lcom/android/launcher3/util/E;
    .locals 2

    .line 1
    :try_start_0
    const-string v0, "#"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    array-length v0, p1

    .line 8
    const/4 v1, 0x2

    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    iget-object p0, p0, LJ1/m;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, LD1/t;

    .line 20
    .line 21
    aget-object v0, p1, v1

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-virtual {p0, v0, v1}, LD1/t;->n(J)Landroid/os/UserHandle;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :goto_0
    const/4 v0, 0x0

    .line 37
    aget-object p1, p1, v0

    .line 38
    .line 39
    invoke-static {p1}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Lcom/android/launcher3/util/E;

    .line 44
    .line 45
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    return-object v0

    .line 49
    :catch_0
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, LJ1/m;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LJ1/m;->m(I)Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    instance-of v0, p2, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const v0, 0x7f0e006d

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 25
    .line 26
    iget-object p3, p0, LJ1/m;->h:Landroid/view/View$OnClickListener;

    .line 27
    .line 28
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object p3, p0, LJ1/m;->i:Landroid/view/View$OnLongClickListener;

    .line 32
    .line 33
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 34
    .line 35
    .line 36
    const/high16 p3, 0x3f800000    # 1.0f

    .line 37
    .line 38
    invoke-virtual {p2, p3}, Lcom/android/launcher3/BubbleTextView;->setLongPressTimeoutFactor(F)V

    .line 39
    .line 40
    .line 41
    iget-object p3, p0, LJ1/m;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 42
    .line 43
    invoke-virtual {p3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    iget p3, p3, Lcom/android/launcher3/h0;->r1:I

    .line 48
    .line 49
    invoke-virtual {p2, p3, p3, p3, p3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p0, p0, LJ1/m;->n:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/android/launcher3/model/data/d;

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Lcom/android/launcher3/BubbleTextView;->v(Lcom/android/launcher3/model/data/d;)V

    .line 61
    .line 62
    .line 63
    return-object p2
.end method

.method public i(Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    iget-object v0, p0, LJ1/m;->m:Ljava/util/Set;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v1, LJ1/a;

    .line 7
    .line 8
    invoke-direct {v1, v0}, LJ1/a;-><init>(Ljava/util/Set;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, v1}, LJ1/m;->t(Lcom/android/launcher3/model/data/y;Ljava/util/function/Function;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, LJ1/m;->j:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(I)Lcom/android/launcher3/model/data/d;
    .locals 0

    .line 1
    iget-object p0, p0, LJ1/m;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/model/data/d;

    .line 8
    .line 9
    return-object p0
.end method

.method public n(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 6

    .line 1
    new-instance v0, LJ1/m$a;

    .line 2
    .line 3
    iget-object v2, p0, LJ1/m;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 4
    .line 5
    iget-object v1, p0, LJ1/m;->m:Ljava/util/Set;

    .line 6
    .line 7
    new-instance v3, Lcom/android/launcher3/util/E;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    iget-object v5, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 14
    .line 15
    invoke-direct {v3, v4, v5}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    move-object v1, p0

    .line 23
    move-object v3, p1

    .line 24
    move-object v4, p2

    .line 25
    invoke-direct/range {v0 .. v5}, LJ1/m$a;-><init>(LJ1/m;Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public o()V
    .locals 2

    .line 1
    iget-object v0, p0, LJ1/m;->j:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LJ1/m;->j:Landroid/content/SharedPreferences;

    .line 7
    .line 8
    const-string v1, "pinned_apps"

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, LJ1/m;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "pinned_apps"

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    new-instance v1, LJ1/d;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2}, LJ1/d;-><init>(LJ1/m;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public t(Lcom/android/launcher3/model/data/y;Ljava/util/function/Function;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/function/Function<",
            "Lcom/android/launcher3/util/E;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/E;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 8
    .line 9
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p2, v0}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, LJ1/m;->j()V

    .line 25
    .line 26
    .line 27
    new-instance p1, Ljava/util/HashSet;

    .line 28
    .line 29
    iget-object p2, p0, LJ1/m;->m:Ljava/util/Set;

    .line 30
    .line 31
    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 32
    .line 33
    .line 34
    sget-object p2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 35
    .line 36
    new-instance v0, LJ1/k;

    .line 37
    .line 38
    invoke-direct {v0, p0, p1}, LJ1/k;-><init>(LJ1/m;Ljava/util/Set;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, v0}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
