.class public Lcom/android/launcher3/popup/n;
.super Ljava/lang/Object;
.source "PopupDataProvider.java"

# interfaces
.implements Lcom/android/launcher3/notification/NotificationListener$a;


# instance fields
.field private final a:Lcom/android/launcher3/views/k;

.field private final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/L1;",
            "Lk1/a;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/E;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/views/k;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/popup/n;->c:Ljava/util/HashMap;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/popup/n;->a:Lcom/android/launcher3/views/k;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic d(Ljava/util/function/Predicate;Ljava/util/function/Predicate;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 2

    .line 1
    instance-of v0, p3, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p2}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move-object p1, p3

    .line 14
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/BubbleTextView;->u(Lcom/android/launcher3/model/data/y;Z)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    instance-of v0, p3, Lcom/android/launcher3/folder/FolderIcon;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    move-object v0, p3

    .line 26
    check-cast v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 27
    .line 28
    instance-of v1, p2, Lcom/android/launcher3/model/data/p;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    move-object v1, p2

    .line 33
    check-cast v1, Lcom/android/launcher3/model/data/p;

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Lcom/android/launcher3/model/data/m;->w(Ljava/util/function/Predicate;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->n0()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    instance-of v0, p2, Lcom/android/launcher3/model/data/A;

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    instance-of v0, p3, Lcom/android/launcher3/widget/suggest/m;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    move-object p1, p3

    .line 60
    check-cast p1, Lcom/android/launcher3/widget/suggest/m;

    .line 61
    .line 62
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/suggest/m;->f1(Ljava/util/function/Predicate;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    instance-of v0, p2, Lcom/android/launcher3/model/data/A;

    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    check-cast p2, Lcom/android/launcher3/model/data/A;

    .line 71
    .line 72
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/A;->z()Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-eqz p2, :cond_3

    .line 77
    .line 78
    instance-of p2, p3, Lcom/android/launcher3/widget/T;

    .line 79
    .line 80
    if-eqz p2, :cond_3

    .line 81
    .line 82
    invoke-static {}, Lk2/k;->q()Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    if-eqz p2, :cond_3

    .line 87
    .line 88
    sget-object p2, Lk2/k;->m:Lcom/android/launcher3/util/I;

    .line 89
    .line 90
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    check-cast p2, Lk2/k;

    .line 103
    .line 104
    invoke-virtual {p2, p1, p0}, Lk2/k;->K(Ljava/util/function/Predicate;Ljava/util/function/Predicate;)V

    .line 105
    .line 106
    .line 107
    :cond_3
    :goto_0
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-eqz p1, :cond_5

    .line 112
    .line 113
    instance-of p1, p3, Lcom/android/launcher3/widget/T;

    .line 114
    .line 115
    if-eqz p1, :cond_5

    .line 116
    .line 117
    check-cast p3, Lcom/android/launcher3/widget/T;

    .line 118
    .line 119
    invoke-virtual {p3}, Lcom/android/launcher3/widget/T;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    if-eqz p1, :cond_5

    .line 124
    .line 125
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-nez p2, :cond_5

    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    :cond_4
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-eqz p2, :cond_5

    .line 140
    .line 141
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    check-cast p2, Landroid/appwidget/AppWidgetHostView;

    .line 146
    .line 147
    instance-of p3, p2, Lcom/android/launcher3/widget/suggest/m;

    .line 148
    .line 149
    if-eqz p3, :cond_4

    .line 150
    .line 151
    check-cast p2, Lcom/android/launcher3/widget/suggest/m;

    .line 152
    .line 153
    invoke-virtual {p2, p0}, Lcom/android/launcher3/widget/suggest/m;->f1(Ljava/util/function/Predicate;)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_5
    const/4 p0, 0x0

    .line 158
    return p0
.end method

.method public static synthetic e(Lcom/android/launcher3/util/L1;Ljava/util/function/Predicate;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/L1;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static synthetic f(Ljava/lang/String;[Ljava/lang/String;LA1/d;)Z
    .locals 1

    .line 1
    iget-object v0, p2, LA1/d;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p2, LA1/d;->c:[Ljava/lang/String;

    .line 11
    .line 12
    array-length p2, p0

    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0
.end method


# virtual methods
.method public a(Lcom/android/launcher3/util/L1;LA1/d;)V
    .locals 4

    .line 1
    const-string v0, "PopupDataProvider"

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/resource/L;->c:[Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    new-instance p0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v1, "onNotificationPosted: "

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object p2, p2, LA1/d;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p2, " postedPackageUserKey.mPackageName:"

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object p1, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 60
    .line 61
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Lk1/a;

    .line 66
    .line 67
    if-nez v2, :cond_2

    .line 68
    .line 69
    new-instance v2, Lk1/a;

    .line 70
    .line 71
    invoke-direct {v2}, Lk1/a;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 75
    .line 76
    invoke-interface {v3, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    iget-object v3, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-nez v3, :cond_1

    .line 86
    .line 87
    iget-object v3, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 88
    .line 89
    if-eqz v3, :cond_1

    .line 90
    .line 91
    iget-object v0, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/launcher3/popup/n;->a:Lcom/android/launcher3/views/k;

    .line 97
    .line 98
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H5;->V0(Ljava/util/HashMap;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .line 118
    .line 119
    const-string v3, "onNotificationPosted, postedPackageUserKey.mPackageName: "

    .line 120
    .line 121
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget-object v3, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v3, " postedPackageUserKey.mUser:"

    .line 130
    .line 131
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget-object v3, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 135
    .line 136
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    :cond_2
    :goto_0
    invoke-virtual {v2, p2}, Lk1/a;->a(LA1/d;)Z

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    if-eqz p2, :cond_3

    .line 151
    .line 152
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    new-instance p2, Lcom/android/launcher3/popup/m;

    .line 156
    .line 157
    invoke-direct {p2, p1}, Lcom/android/launcher3/popup/m;-><init>(Lcom/android/launcher3/util/L1;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p2}, Lcom/android/launcher3/popup/n;->l(Ljava/util/function/Predicate;)V

    .line 161
    .line 162
    .line 163
    :cond_3
    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/service/notification/StatusBarNotification;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_3

    .line 4
    .line 5
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_4

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Landroid/service/notification/StatusBarNotification;

    .line 37
    .line 38
    invoke-static {v2}, Lcom/android/launcher3/util/L1;->c(Landroid/service/notification/StatusBarNotification;)Lcom/android/launcher3/util/L1;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const-string v4, "PopupDataProvider"

    .line 43
    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    sget-object v5, Lcom/android/launcher3/resource/L;->c:[Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    iget-object v6, v3, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 53
    .line 54
    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-eqz v5, :cond_1

    .line 59
    .line 60
    new-instance v2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v5, "onNotificationFullRefresh  packageUserKey.mPackageName:"

    .line 66
    .line 67
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v3, v3, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    iget-object v5, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 84
    .line 85
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    check-cast v5, Lk1/a;

    .line 90
    .line 91
    if-nez v5, :cond_3

    .line 92
    .line 93
    new-instance v5, Lk1/a;

    .line 94
    .line 95
    invoke-direct {v5}, Lk1/a;-><init>()V

    .line 96
    .line 97
    .line 98
    iget-object v6, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 99
    .line 100
    invoke-interface {v6, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    iget-object v6, v3, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    if-nez v6, :cond_2

    .line 110
    .line 111
    iget-object v6, v3, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 112
    .line 113
    if-eqz v6, :cond_2

    .line 114
    .line 115
    iget-object v3, v3, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    const-string v7, "onNotificationPosted, packageUserKey.mPackageName: "

    .line 127
    .line 128
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    iget-object v7, v3, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v7, " packageUserKey.mUser:"

    .line 137
    .line 138
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    iget-object v3, v3, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 142
    .line 143
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    :cond_3
    :goto_1
    invoke-static {v2}, LA1/d;->d(Landroid/service/notification/StatusBarNotification;)LA1/d;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-virtual {v5, v2}, Lk1/a;->a(LA1/d;)Z

    .line 158
    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/popup/n;->a:Lcom/android/launcher3/views/k;

    .line 163
    .line 164
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p1, v1}, Lcom/android/launcher3/H5;->V0(Ljava/util/HashMap;)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 180
    .line 181
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    :cond_5
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-eqz v1, :cond_7

    .line 194
    .line 195
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    check-cast v1, Lcom/android/launcher3/util/L1;

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    check-cast v2, Lk1/a;

    .line 206
    .line 207
    iget-object v3, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 208
    .line 209
    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    check-cast v3, Lk1/a;

    .line 214
    .line 215
    if-eqz v2, :cond_6

    .line 216
    .line 217
    if-eqz v3, :cond_5

    .line 218
    .line 219
    invoke-virtual {v2}, Lk1/a;->d()I

    .line 220
    .line 221
    .line 222
    move-result v2

    .line 223
    invoke-virtual {v3}, Lk1/a;->d()I

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    if-eq v2, v4, :cond_5

    .line 228
    .line 229
    :cond_6
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    goto :goto_2

    .line 233
    :cond_7
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    if-nez p1, :cond_8

    .line 238
    .line 239
    new-instance p1, Lcom/android/launcher3/popup/j;

    .line 240
    .line 241
    invoke-direct {p1, v0}, Lcom/android/launcher3/popup/j;-><init>(Ljava/util/HashMap;)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0, p1}, Lcom/android/launcher3/popup/n;->l(Ljava/util/function/Predicate;)V

    .line 245
    .line 246
    .line 247
    :cond_8
    :goto_3
    return-void
.end method

.method public c(Lcom/android/launcher3/util/L1;LA1/d;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "onNotificationRemoved: "

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-object v1, p2, LA1/d;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "PopupDataProvider"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 28
    .line 29
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lk1/a;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Lk1/a;->f(LA1/d;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_2

    .line 42
    .line 43
    invoke-virtual {v0}, Lk1/a;->e()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-nez p2, :cond_1

    .line 52
    .line 53
    iget-object p2, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 54
    .line 55
    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    :cond_1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    new-instance p2, Lcom/android/launcher3/popup/m;

    .line 62
    .line 63
    invoke-direct {p2, p1}, Lcom/android/launcher3/popup/m;-><init>(Lcom/android/launcher3/util/L1;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p2}, Lcom/android/launcher3/popup/n;->l(Ljava/util/function/Predicate;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    return-void
.end method

.method public g(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "PopupDataProvider:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, "\tmPackageUserToDotInfos:"

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public h(Lcom/android/launcher3/model/data/y;)Lk1/a;
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/util/r2;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/android/launcher3/util/L1;->a(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/L1;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lk1/a;

    .line 25
    .line 26
    if-nez p0, :cond_2

    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_2
    invoke-static {p1}, Lcom/android/launcher3/util/r2;->b(Lcom/android/launcher3/model/data/y;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    invoke-static {p1}, Lcom/android/launcher3/util/r2;->a(Lcom/android/launcher3/model/data/y;)[Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0}, Lk1/a;->e()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    new-instance v3, Lcom/android/launcher3/popup/i;

    .line 49
    .line 50
    invoke-direct {v3, v0, p1}, Lcom/android/launcher3/popup/i;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_4

    .line 58
    .line 59
    :goto_0
    return-object p0

    .line 60
    :cond_4
    return-object v1
.end method

.method public i()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/L1;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/popup/n;->b:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/util/Map$Entry;

    .line 27
    .line 28
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/android/launcher3/util/L1;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-object v0
.end method

.method public j(Lcom/android/launcher3/model/data/y;)I
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/util/r2;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    instance-of v0, p1, Lcom/android/launcher3/model/data/A;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    move-object v0, p1

    .line 24
    check-cast v0, Lcom/android/launcher3/model/data/A;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    iget p1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 33
    .line 34
    const/4 v2, 0x4

    .line 35
    if-eq p1, v2, :cond_1

    .line 36
    .line 37
    const/4 v2, 0x5

    .line 38
    if-ne p1, v2, :cond_2

    .line 39
    .line 40
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/popup/n;->c:Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-static {v0, p0}, Lcom/android/launcher3/widget/group/b;->e0(Lcom/android/launcher3/model/data/A;Ljava/util/HashMap;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :cond_2
    return v1

    .line 48
    :cond_3
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-nez v0, :cond_4

    .line 53
    .line 54
    return v1

    .line 55
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/popup/n;->c:Ljava/util/HashMap;

    .line 56
    .line 57
    new-instance v2, Lcom/android/launcher3/util/E;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 60
    .line 61
    invoke-direct {v2, v0, p1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Ljava/lang/Integer;

    .line 69
    .line 70
    if-nez p0, :cond_5

    .line 71
    .line 72
    return v1

    .line 73
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0
.end method

.method public k(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/E;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/n;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    return-void
.end method

.method public l(Ljava/util/function/Predicate;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/util/L1;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/popup/k;

    .line 8
    .line 9
    invoke-direct {v1, v0, p1}, Lcom/android/launcher3/popup/k;-><init>(Lcom/android/launcher3/util/L1;Ljava/util/function/Predicate;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/popup/l;

    .line 13
    .line 14
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/popup/l;-><init>(Ljava/util/function/Predicate;Ljava/util/function/Predicate;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/popup/n;->a:Lcom/android/launcher3/views/k;

    .line 18
    .line 19
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getContent()Lcom/android/launcher3/util/Y0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1, v0}, Lcom/android/launcher3/util/Y0;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/popup/n;->a:Lcom/android/launcher3/views/k;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Lcom/android/launcher3/folder/Folder;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/popup/n;->a:Lcom/android/launcher3/views/k;

    .line 38
    .line 39
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/D;->C(Ljava/util/function/Predicate;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method
