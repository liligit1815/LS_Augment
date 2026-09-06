.class public Lcom/android/launcher3/widget/suggest/v;
.super Ljava/lang/Object;
.source "SuggestWidgetUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/suggest/v$h;,
        Lcom/android/launcher3/widget/suggest/v$f;,
        Lcom/android/launcher3/widget/suggest/v$i;,
        Lcom/android/launcher3/widget/suggest/v$g;
    }
.end annotation


# static fields
.field public static final a:Z

.field public static final b:Z

.field public static final c:Z

.field public static final d:Z

.field private static e:Z

.field private static final f:Lcom/android/launcher3/popup/P$i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation
.end field

.field private static final g:Lcom/android/launcher3/popup/P$i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation
.end field

.field private static final h:Lcom/android/launcher3/popup/P$i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation
.end field

.field private static final i:Landroid/net/Uri;

.field private static j:Lcom/android/launcher3/widget/suggest/m;

.field private static final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/widget/suggest/v$h;",
            ">;"
        }
    .end annotation
.end field

.field private static final l:Lcom/android/launcher3/widget/suggest/v$h;

.field private static final m:Ljava/util/Comparator;

.field private static final n:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    sget-boolean v0, Lcom/android/launcher3/O;->a:Z

    .line 2
    .line 3
    sput-boolean v0, Lcom/android/launcher3/widget/suggest/v;->a:Z

    .line 4
    .line 5
    sput-boolean v0, Lcom/android/launcher3/widget/suggest/v;->b:Z

    .line 6
    .line 7
    sput-boolean v0, Lcom/android/launcher3/widget/suggest/v;->c:Z

    .line 8
    .line 9
    sput-boolean v0, Lcom/android/launcher3/widget/suggest/v;->d:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    sput-boolean v0, Lcom/android/launcher3/widget/suggest/v;->e:Z

    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/widget/suggest/q;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/android/launcher3/widget/suggest/q;-><init>()V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/launcher3/widget/suggest/v;->f:Lcom/android/launcher3/popup/P$i;

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/widget/suggest/r;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/android/launcher3/widget/suggest/r;-><init>()V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/android/launcher3/widget/suggest/v;->g:Lcom/android/launcher3/popup/P$i;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/widget/suggest/s;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/android/launcher3/widget/suggest/s;-><init>()V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/android/launcher3/widget/suggest/v;->h:Lcom/android/launcher3/popup/P$i;

    .line 34
    .line 35
    const-string v0, "content://com.zte.mifavor.suggest.SuggestOutProvider"

    .line 36
    .line 37
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/android/launcher3/widget/suggest/v;->i:Landroid/net/Uri;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    sput-object v0, Lcom/android/launcher3/widget/suggest/v;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 45
    .line 46
    new-instance v1, Lcom/android/launcher3/widget/suggest/v$h;

    .line 47
    .line 48
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    const/16 v0, 0xc

    .line 55
    .line 56
    :goto_0
    move v5, v0

    .line 57
    goto :goto_1

    .line 58
    :cond_0
    const/4 v0, 0x4

    .line 59
    goto :goto_0

    .line 60
    :goto_1
    const/4 v6, 0x0

    .line 61
    const-string v2, "2x2"

    .line 62
    .line 63
    const-string v3, "suggest_2x2"

    .line 64
    .line 65
    const-string v4, "max_app_count_2x2"

    .line 66
    .line 67
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/widget/suggest/v$h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/android/launcher3/widget/suggest/w;)V

    .line 68
    .line 69
    .line 70
    new-instance v2, Lcom/android/launcher3/widget/suggest/v$h;

    .line 71
    .line 72
    const/16 v6, 0x8

    .line 73
    .line 74
    const/4 v7, 0x0

    .line 75
    const-string v3, "4x2"

    .line 76
    .line 77
    const-string v4, "suggest_4x2"

    .line 78
    .line 79
    const-string v5, "max_app_count_4x2"

    .line 80
    .line 81
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/widget/suggest/v$h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/android/launcher3/widget/suggest/w;)V

    .line 82
    .line 83
    .line 84
    new-instance v3, Lcom/android/launcher3/widget/suggest/v$h;

    .line 85
    .line 86
    const/16 v7, 0x8

    .line 87
    .line 88
    const/4 v8, 0x0

    .line 89
    const-string v4, "4x4"

    .line 90
    .line 91
    const-string v5, "suggest_4x4"

    .line 92
    .line 93
    const-string v6, "max_app_count_4x4"

    .line 94
    .line 95
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/widget/suggest/v$h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/android/launcher3/widget/suggest/w;)V

    .line 96
    .line 97
    .line 98
    filled-new-array {v1, v2, v3}, [Lcom/android/launcher3/widget/suggest/v$h;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    sput-object v0, Lcom/android/launcher3/widget/suggest/v;->k:Ljava/util/List;

    .line 107
    .line 108
    new-instance v1, Lcom/android/launcher3/widget/suggest/v$h;

    .line 109
    .line 110
    const/4 v5, 0x4

    .line 111
    const/4 v6, 0x0

    .line 112
    const-string v2, "2x2"

    .line 113
    .line 114
    const-string v3, "suggest_2x2"

    .line 115
    .line 116
    const-string v4, "max_app_count_2x2"

    .line 117
    .line 118
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/widget/suggest/v$h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/android/launcher3/widget/suggest/w;)V

    .line 119
    .line 120
    .line 121
    sput-object v1, Lcom/android/launcher3/widget/suggest/v;->l:Lcom/android/launcher3/widget/suggest/v$h;

    .line 122
    .line 123
    new-instance v0, Lcom/android/launcher3/widget/suggest/v$e;

    .line 124
    .line 125
    invoke-direct {v0}, Lcom/android/launcher3/widget/suggest/v$e;-><init>()V

    .line 126
    .line 127
    .line 128
    sput-object v0, Lcom/android/launcher3/widget/suggest/v;->m:Ljava/util/Comparator;

    .line 129
    .line 130
    const-string v0, "content://com.zte.aiengine.provider.aiproduct"

    .line 131
    .line 132
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    sput-object v0, Lcom/android/launcher3/widget/suggest/v;->n:Landroid/net/Uri;

    .line 137
    .line 138
    return-void
.end method

.method public static A(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

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
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/android/launcher3/anim/C;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/anim/C;->C()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public static B()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method

.method public static C(Lcom/android/launcher3/C2;Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    instance-of v0, p1, Lcom/android/launcher3/widget/suggest/e;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const v0, 0x7f0b059b

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    instance-of v2, v0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    check-cast v0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isNeedShowStatement()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v2, "jumpSuggestStatementIfNeed jumpToSuggestOutActivityWhenNeedShowStatement appIconTagData="

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "SuggestWidgetUtils"

    .line 50
    .line 51
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    check-cast p1, Lcom/android/launcher3/widget/suggest/e;

    .line 55
    .line 56
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/suggest/v;->F(Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/suggest/e;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :cond_1
    :goto_0
    return v1
.end method

.method protected static D(Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/suggest/m;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->s()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "event_type"

    .line 6
    .line 7
    const-string v2, "event_type_delete_last_suggest_widget"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x578

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 15
    .line 16
    .line 17
    sput-object p1, Lcom/android/launcher3/widget/suggest/v;->j:Lcom/android/launcher3/widget/suggest/m;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    const-string v0, "SuggestWidgetUtils"

    .line 22
    .line 23
    const-string v1, "jumpToSuggestOutActivityWhenDeleteLastSuggestWidget"

    .line 24
    .line 25
    invoke-static {v0, v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/suggest/m;->N0(Z)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    sput-object p0, Lcom/android/launcher3/widget/suggest/v;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 34
    .line 35
    return-void
.end method

.method private static E(Lcom/android/launcher3/C2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "SuggestWidgetUtils"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "jumpToSuggestOutActivity event="

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, ", data="

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->s()Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "event_type"

    .line 36
    .line 37
    const-string v3, "event_type_icon_long_click"

    .line 38
    .line 39
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    const-string v2, "event"

    .line 43
    .line 44
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    const-string p1, "data"

    .line 48
    .line 49
    invoke-virtual {v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    const-string p1, "app_title"

    .line 53
    .line 54
    invoke-virtual {v1, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    const-string p1, "app_replaced_title"

    .line 58
    .line 59
    invoke-virtual {v1, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    const/16 p1, 0x578

    .line 63
    .line 64
    invoke-virtual {p0, v1, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    const-string p1, "jumpToSuggestOutActivityWhenIconLongClick error"

    .line 70
    .line 71
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private static F(Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/suggest/e;)V
    .locals 4

    .line 1
    const-string v0, "SuggestWidgetUtils"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "jumpToSuggestOutActivityWhenNeedShowStatement isCustomIcon="

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    instance-of v2, p1, Lcom/android/launcher3/widget/suggest/a;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->s()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "event_type"

    .line 30
    .line 31
    const-string v3, "event_type_show_statement"

    .line 32
    .line 33
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    const-string v2, "suggest_push_icon_is_custom_icon"

    .line 37
    .line 38
    instance-of v3, p1, Lcom/android/launcher3/widget/suggest/a;

    .line 39
    .line 40
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    instance-of v2, p1, Landroid/view/View;

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    check-cast p1, Landroid/view/View;

    .line 48
    .line 49
    const v2, 0x7f0b059d

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    goto :goto_0

    .line 57
    :catch_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :cond_0
    const/4 p1, 0x0

    .line 60
    :goto_0
    instance-of v2, p1, Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    const-string v2, "suggest_push_icon_origin_tag_text"

    .line 65
    .line 66
    check-cast p1, Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    :cond_1
    const/16 p1, 0x578

    .line 72
    .line 73
    invoke-virtual {p0, v1, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :goto_1
    const-string p1, "jumpToSuggestOutActivityWhenNeedShowStatement error"

    .line 78
    .line 79
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private static G(Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/suggest/e;Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;)V
    .locals 4

    .line 1
    const-string v0, "SuggestWidgetUtils"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "jumpToSuggestOutActivityWhenSuggestPushIconClick isCustomIcon="

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    instance-of v2, p1, Lcom/android/launcher3/widget/suggest/a;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->s()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "event_type"

    .line 30
    .line 31
    const-string v3, "event_type_suggest_push_icon_click"

    .line 32
    .line 33
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    const-string v2, "suggest_push_icon_is_custom_icon"

    .line 37
    .line 38
    instance-of v3, p1, Lcom/android/launcher3/widget/suggest/a;

    .line 39
    .line 40
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    instance-of v2, p1, Landroid/view/View;

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    check-cast p1, Landroid/view/View;

    .line 49
    .line 50
    const v2, 0x7f0b059d

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    goto :goto_0

    .line 58
    :catch_0
    move-exception p0

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    move-object p1, v3

    .line 61
    :goto_0
    instance-of v2, p1, Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v2, :cond_1

    .line 64
    .line 65
    const-string v2, "suggest_push_icon_origin_tag_text"

    .line 66
    .line 67
    check-cast p1, Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    :cond_1
    const-string p1, "suggest_push_icon_suggest_nubia_push_data"

    .line 73
    .line 74
    if-eqz p2, :cond_2

    .line 75
    .line 76
    new-instance v2, Lcom/google/gson/f;

    .line 77
    .line 78
    invoke-direct {v2}, Lcom/google/gson/f;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, p2}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    :cond_2
    invoke-virtual {v1, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 86
    .line 87
    .line 88
    const/16 p1, 0x578

    .line 89
    .line 90
    invoke-virtual {p0, v1, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :goto_1
    const-string p1, "jumpToSuWhenSuggestPushIconClick error"

    .line 95
    .line 96
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public static H(Lcom/android/launcher3/C2;ILcom/android/launcher3/widget/T;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    instance-of p1, p2, Lcom/android/launcher3/widget/suggest/m;

    .line 9
    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    const/4 p1, 0x0

    .line 14
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/suggest/v;->P(Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/suggest/m;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static I(Lcom/android/launcher3/C2;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    new-instance v2, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    new-instance v4, Lcom/android/launcher3/widget/suggest/t;

    .line 22
    .line 23
    invoke-direct {v4, v2}, Lcom/android/launcher3/widget/suggest/t;-><init>(Ljava/util/ArrayList;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3, v4}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const-string v4, "SuggestWidgetUtils"

    .line 34
    .line 35
    if-nez v3, :cond_1

    .line 36
    .line 37
    new-instance v3, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v5, "onLoaderTaskBindAllApplications hasCustomIconImgViewList="

    .line 43
    .line 44
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->l(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->o(Lcom/android/launcher3/C2;)V

    .line 65
    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-static {p0, v2}, Lcom/android/launcher3/widget/suggest/v;->P(Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/suggest/m;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->O(Lcom/android/launcher3/C2;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 75
    .line 76
    .line 77
    move-result-wide v2

    .line 78
    new-instance p0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v5, "onLoaderTaskBindAllApplications end hao="

    .line 84
    .line 85
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    sub-long/2addr v2, v0

    .line 89
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v0, "ms"

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static J(Lcom/android/launcher3/C2;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/suggest/v;->K(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static K(Lcom/android/launcher3/C2;Landroid/view/View;)Z
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    instance-of v0, p1, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const v0, 0x7f0b059b

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    instance-of v0, p1, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    move-object v3, p1

    .line 26
    check-cast v3, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isInAIFutureScreen()Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    invoke-static {p0, v3}, Lcom/android/launcher3/widget/suggest/v;->m(Landroid/content/Context;Lcom/android/launcher3/widget/suggest/data/AppIconTagData;)V

    .line 35
    .line 36
    .line 37
    return v2

    .line 38
    :cond_1
    if-eqz v0, :cond_3

    .line 39
    .line 40
    move-object v0, p1

    .line 41
    check-cast v0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isLocked()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v3, "onLockedSuggestWidgetIconClicked dataTag="

    .line 56
    .line 57
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string v1, "SuggestWidgetUtils"

    .line 68
    .line 69
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/suggest/v;->n(Landroid/content/Context;Lcom/android/launcher3/widget/suggest/data/AppIconTagData;)V

    .line 73
    .line 74
    .line 75
    return v2

    .line 76
    :cond_3
    :goto_0
    return v1
.end method

.method public static L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1

    .line 1
    new-instance p2, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    const-string v0, "delete_suggest_widget_other_widget_id"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    if-eqz p3, :cond_2

    .line 26
    .line 27
    const-string p1, "suggest_widget_ids"

    .line 28
    .line 29
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v0, "other_widget_component_name_strings"

    .line 34
    .line 35
    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-static {p0, p1, p3}, Lcom/android/launcher3/widget/suggest/g;->c(Landroid/content/Context;[ILjava/util/ArrayList;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-object p2
.end method

.method public static M(Lcom/android/launcher3/C2;Landroid/view/View;)Z
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    instance-of v0, p1, Lcom/android/launcher3/widget/suggest/e;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object v0, p1

    .line 14
    check-cast v0, Lcom/android/launcher3/widget/suggest/e;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/widget/suggest/v;->r(Lcom/android/launcher3/widget/suggest/e;)Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    instance-of p1, p1, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 21
    .line 22
    const-string v3, "SuggestWidgetUtils"

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    iget-boolean p1, v2, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->inSuggestWidget:Z

    .line 29
    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string p1, "onSuggestWidgetPushIconClick but is launcher push icon return false, suggestNubiaPushConfig="

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    return v1

    .line 53
    :cond_2
    const-string p1, "onSuggestWidgetPushIconClick"

    .line 54
    .line 55
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    invoke-static {p0, v0, v2}, Lcom/android/launcher3/widget/suggest/v;->G(Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/suggest/e;Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_3
    :goto_0
    return v1
.end method

.method private static N(Landroid/content/Context;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/widget/suggest/m;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/android/launcher3/widget/suggest/m;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/android/launcher3/widget/suggest/m;->getMaxAppIconCount()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x4

    .line 34
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/16 v2, 0x8

    .line 39
    .line 40
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move v0, v1

    .line 46
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v3, "saveSuggestWidgetMaxAppCount count="

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v3, " maxAppCount="

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v3, " list.size="

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    const-string v3, "SuggestWidgetUtils"

    .line 84
    .line 85
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    sget-object v2, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 89
    .line 90
    new-instance v3, Lcom/android/launcher3/widget/suggest/v$d;

    .line 91
    .line 92
    invoke-direct {v3, p0, v1, v0, p1}, Lcom/android/launcher3/widget/suggest/v$d;-><init>(Landroid/content/Context;IILjava/util/List;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public static O(Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/g0;->i2()Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 16
    .line 17
    new-instance v2, Lcom/android/launcher3/widget/suggest/u;

    .line 18
    .line 19
    invoke-direct {v2, v0, p0}, Lcom/android/launcher3/widget/suggest/u;-><init>(Ljava/util/ArrayList;Lcom/android/launcher3/C2;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static P(Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/suggest/m;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Lcom/android/launcher3/widget/suggest/p;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Lcom/android/launcher3/widget/suggest/p;-><init>(Ljava/util/ArrayList;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/suggest/v;->N(Landroid/content/Context;Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic a(Ljava/util/ArrayList;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p1, p2, Lcom/android/launcher3/widget/suggest/m;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/android/launcher3/widget/suggest/m;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static synthetic b(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/suggest/v$f;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/widget/suggest/v$f;-><init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic c(Landroid/os/Bundle;Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "checkSuggestWidgetScreenAppList THREAD_POOL_EXECUTOR execute bundle="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "SuggestWidgetUtils"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object v0, Lcom/android/launcher3/widget/suggest/v;->n:Landroid/net/Uri;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 30
    .line 31
    .line 32
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    :try_start_1
    const-string v0, "suggest_widget_launcher_screen_apps"

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {p1, v0, v2, p0}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 37
    .line 38
    .line 39
    :try_start_2
    invoke-virtual {p1}, Landroid/content/ContentProviderClient;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :catchall_1
    move-exception p0

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    :try_start_3
    invoke-virtual {p1}, Landroid/content/ContentProviderClient;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_2
    move-exception p1

    .line 53
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    :goto_0
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 57
    :goto_1
    const-string p1, "checkSuggestWidgetScreenAppList THREAD_POOL_EXECUTOR execute error"

    .line 58
    .line 59
    invoke-static {v1, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/suggest/v$g;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/widget/suggest/v$g;-><init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic e(Ljava/util/ArrayList;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p1, p2, Lcom/android/launcher3/widget/suggest/m;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/android/launcher3/widget/suggest/m;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static synthetic f(Ljava/util/ArrayList;Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateHiddenAppsToAIEngine THREAD_POOL_EXECUTOR execute hideAppList="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "SuggestWidgetUtils"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    new-instance v0, Landroid/os/Bundle;

    .line 28
    .line 29
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v2, "appHiddens"

    .line 33
    .line 34
    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 35
    .line 36
    .line 37
    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget-object p1, Lcom/android/launcher3/widget/suggest/v;->n:Landroid/net/Uri;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 44
    .line 45
    .line 46
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    :try_start_1
    const-string p1, "suggest_widget_launcher_hidden_apps"

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {p0, p1, v2, v0}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 51
    .line 52
    .line 53
    :try_start_2
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :catchall_1
    move-exception p1

    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    :try_start_3
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_2
    move-exception p0

    .line 67
    :try_start_4
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    :goto_0
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 71
    :goto_1
    const-string p1, "updateHiddenAppsToAIEngine THREAD_POOL_EXECUTOR execute error"

    .line 72
    .line 73
    invoke-static {v1, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/suggest/v$i;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/widget/suggest/v$i;-><init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic h(Ljava/util/ArrayList;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p1, p2, Lcom/android/launcher3/widget/suggest/m;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    check-cast p2, Lcom/android/launcher3/widget/suggest/m;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/android/launcher3/widget/suggest/m;->C0()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string p0, "SuggestWidgetUtils"

    .line 18
    .line 19
    const-string p1, "onLoaderTaskBindAllApplications enter updateAppIcons"

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/android/launcher3/widget/suggest/m;->O0()V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method static bridge synthetic i()Landroid/net/Uri;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/suggest/v;->i:Landroid/net/Uri;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/widget/suggest/v;->k(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static k(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-static {p2}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    instance-of v0, p2, Landroid/widget/TextView;

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    move-object v2, p2

    .line 19
    check-cast v2, Landroid/widget/TextView;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v0, v1

    .line 37
    :goto_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    instance-of v2, v2, Lcom/android/launcher3/model/data/d;

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lcom/android/launcher3/model/data/d;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    instance-of v2, v2, Lcom/android/launcher3/model/data/I;

    .line 74
    .line 75
    if-eqz v2, :cond_2

    .line 76
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 87
    .line 88
    iget-object v2, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    :cond_2
    :goto_1
    const v2, 0x7f0b059b

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    instance-of v3, v2, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 108
    .line 109
    if-eqz v3, :cond_5

    .line 110
    .line 111
    const v3, 0x7f0b059e

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    instance-of v3, p2, Lcom/android/launcher3/widget/suggest/m;

    .line 119
    .line 120
    if-eqz v3, :cond_3

    .line 121
    .line 122
    check-cast p2, Lcom/android/launcher3/widget/suggest/m;

    .line 123
    .line 124
    invoke-virtual {p2}, Lcom/android/launcher3/widget/suggest/m;->getLockedAppBubbleTextView()Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    if-eqz p2, :cond_3

    .line 129
    .line 130
    new-instance v3, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    instance-of v4, v4, Lcom/android/launcher3/model/data/d;

    .line 154
    .line 155
    if-eqz v4, :cond_4

    .line 156
    .line 157
    new-instance v3, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    check-cast p2, Lcom/android/launcher3/model/data/d;

    .line 167
    .line 168
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 169
    .line 170
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    goto :goto_2

    .line 181
    :cond_3
    const/4 v3, 0x0

    .line 182
    :cond_4
    :goto_2
    new-instance p2, Lcom/google/gson/f;

    .line 183
    .line 184
    invoke-direct {p2}, Lcom/google/gson/f;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, v2}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    invoke-static {p0, p1, p2, v0, v3}, Lcom/android/launcher3/widget/suggest/v;->E(Lcom/android/launcher3/C2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    :cond_5
    return-void
.end method

.method private static l(Landroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/suggest/v$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/suggest/v$a;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static m(Landroid/content/Context;Lcom/android/launcher3/widget/suggest/data/AppIconTagData;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isInAIFutureScreen()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 11
    .line 12
    new-instance v1, Lcom/android/launcher3/widget/suggest/v$c;

    .line 13
    .line 14
    invoke-direct {v1, p1, p0}, Lcom/android/launcher3/widget/suggest/v$c;-><init>(Lcom/android/launcher3/widget/suggest/data/AppIconTagData;Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method

.method private static n(Landroid/content/Context;Lcom/android/launcher3/widget/suggest/data/AppIconTagData;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isLocked()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 11
    .line 12
    new-instance v1, Lcom/android/launcher3/widget/suggest/v$b;

    .line 13
    .line 14
    invoke-direct {v1, p1, p0}, Lcom/android/launcher3/widget/suggest/v$b;-><init>(Lcom/android/launcher3/widget/suggest/data/AppIconTagData;Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method

.method public static o(Lcom/android/launcher3/C2;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    new-instance v3, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v4}, Lx1/Z;->d()Landroid/util/Pair;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    iget-object v4, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v4, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-virtual {v5, v4}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-eqz v4, :cond_2

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :cond_2
    const/4 v5, 0x0

    .line 52
    move v6, v5

    .line 53
    :goto_1
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    if-ge v6, v7, :cond_4

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-virtual {v7, v6}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    instance-of v8, v7, Lcom/android/launcher3/CellLayout;

    .line 72
    .line 73
    if-eqz v8, :cond_3

    .line 74
    .line 75
    if-eq v7, v4, :cond_3

    .line 76
    .line 77
    check-cast v7, Lcom/android/launcher3/CellLayout;

    .line 78
    .line 79
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :cond_3
    add-int/lit8 v6, v6, 0x1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .line 89
    .line 90
    move v6, v5

    .line 91
    :goto_2
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    invoke-virtual {v7}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    if-ge v6, v7, :cond_5

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    invoke-virtual {v7}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    invoke-virtual {v7, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    add-int/lit8 v6, v6, 0x1

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_5
    sget-object v6, Lcom/android/launcher3/widget/suggest/v;->m:Ljava/util/Comparator;

    .line 124
    .line 125
    invoke-static {v4, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 126
    .line 127
    .line 128
    new-instance v6, Ljava/util/HashMap;

    .line 129
    .line 130
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 131
    .line 132
    .line 133
    new-instance v7, Ljava/util/HashMap;

    .line 134
    .line 135
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 143
    .line 144
    .line 145
    move-result v8

    .line 146
    const/4 v9, 0x1

    .line 147
    if-eqz v8, :cond_11

    .line 148
    .line 149
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v8

    .line 153
    check-cast v8, Lcom/android/launcher3/CellLayout;

    .line 154
    .line 155
    new-instance v10, Ljava/util/ArrayList;

    .line 156
    .line 157
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 158
    .line 159
    .line 160
    move v11, v5

    .line 161
    :goto_3
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 162
    .line 163
    .line 164
    move-result-object v12

    .line 165
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getChildCount()I

    .line 166
    .line 167
    .line 168
    move-result v12

    .line 169
    if-ge v11, v12, :cond_7

    .line 170
    .line 171
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 172
    .line 173
    .line 174
    move-result-object v12

    .line 175
    invoke-virtual {v12, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v12

    .line 179
    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    add-int/lit8 v11, v11, 0x1

    .line 183
    .line 184
    goto :goto_3

    .line 185
    :cond_7
    sget-object v8, Lcom/android/launcher3/widget/suggest/v;->m:Ljava/util/Comparator;

    .line 186
    .line 187
    invoke-static {v10, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 188
    .line 189
    .line 190
    new-instance v8, Ljava/util/ArrayList;

    .line 191
    .line 192
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 193
    .line 194
    .line 195
    new-instance v11, Ljava/util/ArrayList;

    .line 196
    .line 197
    invoke-direct {v11, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 201
    .line 202
    .line 203
    move-result-object v10

    .line 204
    :cond_8
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 205
    .line 206
    .line 207
    move-result v12

    .line 208
    if-eqz v12, :cond_10

    .line 209
    .line 210
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v12

    .line 214
    check-cast v12, Landroid/view/View;

    .line 215
    .line 216
    instance-of v13, v12, Lcom/android/launcher3/widget/suggest/m;

    .line 217
    .line 218
    if-eqz v13, :cond_9

    .line 219
    .line 220
    check-cast v12, Lcom/android/launcher3/widget/suggest/m;

    .line 221
    .line 222
    invoke-virtual {v12}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 223
    .line 224
    .line 225
    move-result-object v13

    .line 226
    if-eqz v13, :cond_f

    .line 227
    .line 228
    iget-object v13, v13, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 229
    .line 230
    if-eqz v13, :cond_f

    .line 231
    .line 232
    invoke-virtual {v13}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v13

    .line 236
    invoke-virtual {v6, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result v14

    .line 240
    if-nez v14, :cond_f

    .line 241
    .line 242
    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    invoke-virtual {v6, v13, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    goto/16 :goto_7

    .line 249
    .line 250
    :cond_9
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object v13

    .line 254
    instance-of v13, v13, Lcom/android/launcher3/model/data/y;

    .line 255
    .line 256
    if-eqz v13, :cond_f

    .line 257
    .line 258
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v13

    .line 262
    check-cast v13, Lcom/android/launcher3/model/data/y;

    .line 263
    .line 264
    iget v14, v13, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 265
    .line 266
    if-eq v14, v9, :cond_8

    .line 267
    .line 268
    const/4 v15, 0x6

    .line 269
    if-ne v14, v15, :cond_a

    .line 270
    .line 271
    goto :goto_4

    .line 272
    :cond_a
    instance-of v14, v12, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 273
    .line 274
    if-eqz v14, :cond_e

    .line 275
    .line 276
    iget v14, v13, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 277
    .line 278
    if-ne v14, v9, :cond_b

    .line 279
    .line 280
    iget v13, v13, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 281
    .line 282
    if-ne v13, v9, :cond_b

    .line 283
    .line 284
    goto :goto_4

    .line 285
    :cond_b
    new-instance v13, Ljava/util/ArrayList;

    .line 286
    .line 287
    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 288
    .line 289
    .line 290
    move v14, v5

    .line 291
    :goto_5
    move-object v15, v12

    .line 292
    check-cast v15, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 293
    .line 294
    iget-object v9, v15, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 295
    .line 296
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 297
    .line 298
    .line 299
    move-result-object v9

    .line 300
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getChildCount()I

    .line 301
    .line 302
    .line 303
    move-result v9

    .line 304
    if-ge v14, v9, :cond_d

    .line 305
    .line 306
    iget-object v9, v15, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 307
    .line 308
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 309
    .line 310
    .line 311
    move-result-object v9

    .line 312
    invoke-virtual {v9, v14}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 313
    .line 314
    .line 315
    move-result-object v9

    .line 316
    instance-of v15, v9, Lcom/android/launcher3/BubbleTextView;

    .line 317
    .line 318
    if-eqz v15, :cond_c

    .line 319
    .line 320
    check-cast v9, Lcom/android/launcher3/BubbleTextView;

    .line 321
    .line 322
    invoke-virtual {v13, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    :cond_c
    add-int/lit8 v14, v14, 0x1

    .line 326
    .line 327
    const/4 v9, 0x1

    .line 328
    goto :goto_5

    .line 329
    :cond_d
    sget-object v9, Lcom/android/launcher3/widget/suggest/v;->m:Ljava/util/Comparator;

    .line 330
    .line 331
    invoke-static {v13, v9}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 335
    .line 336
    .line 337
    move-result-object v9

    .line 338
    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 339
    .line 340
    .line 341
    move-result v13

    .line 342
    if-eqz v13, :cond_e

    .line 343
    .line 344
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v13

    .line 348
    check-cast v13, Lcom/android/launcher3/BubbleTextView;

    .line 349
    .line 350
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    goto :goto_6

    .line 354
    :cond_e
    instance-of v9, v12, Lcom/android/launcher3/BubbleTextView;

    .line 355
    .line 356
    if-eqz v9, :cond_f

    .line 357
    .line 358
    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    :cond_f
    :goto_7
    const/4 v9, 0x1

    .line 362
    goto/16 :goto_4

    .line 363
    .line 364
    :cond_10
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    .line 365
    .line 366
    .line 367
    move-result v9

    .line 368
    if-nez v9, :cond_6

    .line 369
    .line 370
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 371
    .line 372
    .line 373
    move-result-object v8

    .line 374
    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 375
    .line 376
    .line 377
    move-result v9

    .line 378
    if-eqz v9, :cond_6

    .line 379
    .line 380
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object v9

    .line 384
    check-cast v9, Lcom/android/launcher3/widget/suggest/m;

    .line 385
    .line 386
    invoke-virtual {v7, v9, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    .line 388
    .line 389
    goto :goto_8

    .line 390
    :cond_11
    new-instance v3, Landroid/os/Bundle;

    .line 391
    .line 392
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 393
    .line 394
    .line 395
    sget-object v4, Lcom/android/launcher3/widget/suggest/v;->k:Ljava/util/List;

    .line 396
    .line 397
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 398
    .line 399
    .line 400
    move-result-object v4

    .line 401
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 402
    .line 403
    .line 404
    move-result v6

    .line 405
    if-eqz v6, :cond_12

    .line 406
    .line 407
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 408
    .line 409
    .line 410
    move-result-object v6

    .line 411
    check-cast v6, Lcom/android/launcher3/widget/suggest/v$h;

    .line 412
    .line 413
    invoke-static {v6}, Lcom/android/launcher3/widget/suggest/v$h;->d(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v6

    .line 417
    invoke-virtual {v3, v6, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 418
    .line 419
    .line 420
    goto :goto_9

    .line 421
    :cond_12
    invoke-virtual {v7}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 422
    .line 423
    .line 424
    move-result-object v4

    .line 425
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 426
    .line 427
    .line 428
    move-result-object v4

    .line 429
    :cond_13
    :goto_a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 430
    .line 431
    .line 432
    move-result v6

    .line 433
    if-eqz v6, :cond_1b

    .line 434
    .line 435
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v6

    .line 439
    check-cast v6, Lcom/android/launcher3/widget/suggest/m;

    .line 440
    .line 441
    new-instance v8, Ljava/util/ArrayList;

    .line 442
    .line 443
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 444
    .line 445
    .line 446
    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object v9

    .line 450
    check-cast v9, Ljava/util/ArrayList;

    .line 451
    .line 452
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 453
    .line 454
    .line 455
    move-result-object v9

    .line 456
    :cond_14
    :goto_b
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 457
    .line 458
    .line 459
    move-result v10

    .line 460
    const-string v11, ""

    .line 461
    .line 462
    if-eqz v10, :cond_17

    .line 463
    .line 464
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v10

    .line 468
    check-cast v10, Landroid/view/View;

    .line 469
    .line 470
    if-eqz v10, :cond_14

    .line 471
    .line 472
    invoke-virtual {v10}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    move-result-object v12

    .line 476
    instance-of v12, v12, Lcom/android/launcher3/model/data/y;

    .line 477
    .line 478
    if-eqz v12, :cond_14

    .line 479
    .line 480
    invoke-virtual {v10}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 481
    .line 482
    .line 483
    move-result-object v10

    .line 484
    check-cast v10, Lcom/android/launcher3/model/data/y;

    .line 485
    .line 486
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v12

    .line 490
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 491
    .line 492
    .line 493
    move-result v12

    .line 494
    if-nez v12, :cond_14

    .line 495
    .line 496
    iget-object v12, v10, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 497
    .line 498
    if-eqz v12, :cond_15

    .line 499
    .line 500
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 501
    .line 502
    .line 503
    move-result-object v12

    .line 504
    iget-object v13, v10, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 505
    .line 506
    invoke-virtual {v12, v13}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 507
    .line 508
    .line 509
    move-result v12

    .line 510
    const/16 v13, 0x3e7

    .line 511
    .line 512
    if-ne v12, v13, :cond_15

    .line 513
    .line 514
    const/4 v12, 0x1

    .line 515
    goto :goto_c

    .line 516
    :cond_15
    move v12, v5

    .line 517
    :goto_c
    new-instance v13, Ljava/lang/StringBuilder;

    .line 518
    .line 519
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 520
    .line 521
    .line 522
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v10

    .line 526
    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    .line 528
    .line 529
    if-eqz v12, :cond_16

    .line 530
    .line 531
    const-string v11, ".clone"

    .line 532
    .line 533
    :cond_16
    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 537
    .line 538
    .line 539
    move-result-object v10

    .line 540
    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 541
    .line 542
    .line 543
    move-result v11

    .line 544
    if-nez v11, :cond_14

    .line 545
    .line 546
    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 547
    .line 548
    .line 549
    goto :goto_b

    .line 550
    :cond_17
    invoke-virtual {v6}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 551
    .line 552
    .line 553
    move-result-object v9

    .line 554
    if-eqz v9, :cond_18

    .line 555
    .line 556
    invoke-virtual {v6}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 557
    .line 558
    .line 559
    move-result-object v9

    .line 560
    iget-object v9, v9, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 561
    .line 562
    if-eqz v9, :cond_18

    .line 563
    .line 564
    invoke-virtual {v6}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 565
    .line 566
    .line 567
    move-result-object v6

    .line 568
    iget-object v6, v6, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 569
    .line 570
    invoke-virtual {v6}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object v11

    .line 574
    :cond_18
    sget-object v6, Lcom/android/launcher3/widget/suggest/v;->k:Ljava/util/List;

    .line 575
    .line 576
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 577
    .line 578
    .line 579
    move-result-object v6

    .line 580
    const/4 v9, 0x0

    .line 581
    :cond_19
    :goto_d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 582
    .line 583
    .line 584
    move-result v10

    .line 585
    if-eqz v10, :cond_1a

    .line 586
    .line 587
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 588
    .line 589
    .line 590
    move-result-object v10

    .line 591
    check-cast v10, Lcom/android/launcher3/widget/suggest/v$h;

    .line 592
    .line 593
    invoke-static {v10}, Lcom/android/launcher3/widget/suggest/v$h;->a(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;

    .line 594
    .line 595
    .line 596
    move-result-object v12

    .line 597
    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 598
    .line 599
    .line 600
    move-result v12

    .line 601
    if-eqz v12, :cond_19

    .line 602
    .line 603
    move-object v9, v10

    .line 604
    goto :goto_d

    .line 605
    :cond_1a
    if-eqz v9, :cond_13

    .line 606
    .line 607
    invoke-static {v9}, Lcom/android/launcher3/widget/suggest/v$h;->d(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;

    .line 608
    .line 609
    .line 610
    move-result-object v6

    .line 611
    invoke-static {v9}, Lcom/android/launcher3/widget/suggest/v$h;->c(Lcom/android/launcher3/widget/suggest/v$h;)I

    .line 612
    .line 613
    .line 614
    move-result v10

    .line 615
    invoke-virtual {v3, v6, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 616
    .line 617
    .line 618
    invoke-static {v9}, Lcom/android/launcher3/widget/suggest/v$h;->b(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    move-result-object v6

    .line 622
    invoke-virtual {v3, v6, v8}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 623
    .line 624
    .line 625
    goto/16 :goto_a

    .line 626
    .line 627
    :cond_1b
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    .line 628
    .line 629
    .line 630
    move-result v4

    .line 631
    if-eqz v4, :cond_1c

    .line 632
    .line 633
    sget-object v4, Lcom/android/launcher3/widget/suggest/v;->l:Lcom/android/launcher3/widget/suggest/v$h;

    .line 634
    .line 635
    invoke-static {v4}, Lcom/android/launcher3/widget/suggest/v$h;->d(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;

    .line 636
    .line 637
    .line 638
    move-result-object v6

    .line 639
    invoke-virtual {v3, v6, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 640
    .line 641
    .line 642
    move-result v5

    .line 643
    if-gtz v5, :cond_1c

    .line 644
    .line 645
    invoke-static {v4}, Lcom/android/launcher3/widget/suggest/v$h;->d(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v5

    .line 649
    invoke-static {v4}, Lcom/android/launcher3/widget/suggest/v$h;->c(Lcom/android/launcher3/widget/suggest/v$h;)I

    .line 650
    .line 651
    .line 652
    move-result v6

    .line 653
    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 654
    .line 655
    .line 656
    invoke-static {v4}, Lcom/android/launcher3/widget/suggest/v$h;->b(Lcom/android/launcher3/widget/suggest/v$h;)Ljava/lang/String;

    .line 657
    .line 658
    .line 659
    move-result-object v4

    .line 660
    new-instance v5, Ljava/util/ArrayList;

    .line 661
    .line 662
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 663
    .line 664
    .line 665
    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 666
    .line 667
    .line 668
    :cond_1c
    new-instance v4, Ljava/lang/StringBuilder;

    .line 669
    .line 670
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 671
    .line 672
    .line 673
    const-string v5, "checkSuggestWidgetScreenAppList hao="

    .line 674
    .line 675
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 676
    .line 677
    .line 678
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 679
    .line 680
    .line 681
    move-result-wide v5

    .line 682
    sub-long/2addr v5, v1

    .line 683
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 684
    .line 685
    .line 686
    const-string v1, "ms bundle="

    .line 687
    .line 688
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 689
    .line 690
    .line 691
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 692
    .line 693
    .line 694
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 695
    .line 696
    .line 697
    move-result-object v1

    .line 698
    const-string v2, "SuggestWidgetUtils"

    .line 699
    .line 700
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 701
    .line 702
    .line 703
    sget-object v1, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 704
    .line 705
    new-instance v2, Lcom/android/launcher3/widget/suggest/n;

    .line 706
    .line 707
    invoke-direct {v2, v3, v0}, Lcom/android/launcher3/widget/suggest/n;-><init>(Landroid/os/Bundle;Lcom/android/launcher3/C2;)V

    .line 708
    .line 709
    .line 710
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 711
    .line 712
    .line 713
    return-void
.end method

.method protected static p(Ljava/lang/String;)Lcom/android/launcher3/widget/suggest/data/AppIconTagData;
    .locals 5

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    :try_start_0
    new-instance v0, Lcom/google/gson/f;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/google/gson/f;-><init>()V

    .line 12
    .line 13
    .line 14
    const-class v2, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 15
    .line 16
    invoke-virtual {v0, p0, v2}, Lcom/google/gson/f;->j(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    :try_start_1
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->updateDatas(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :catchall_0
    move-exception v1

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-object v0

    .line 31
    :catchall_1
    move-exception v0

    .line 32
    move-object v4, v1

    .line 33
    move-object v1, v0

    .line 34
    move-object v0, v4

    .line 35
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v3, "getAppIconTagDataByTagText tagText="

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string v2, "SuggestWidgetUtils"

    .line 53
    .line 54
    invoke-static {v2, p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    .line 56
    .line 57
    return-object v0
.end method

.method public static q(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/widget/suggest/e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/widget/suggest/e;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->r(Lcom/android/launcher3/widget/suggest/e;)Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method private static r(Lcom/android/launcher3/widget/suggest/e;)Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;
    .locals 3

    .line 1
    instance-of v0, p0, Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    move-object v0, p0

    .line 7
    check-cast v0, Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    instance-of v2, p0, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->w(Lcom/android/launcher3/BubbleTextView;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_1
    const p0, 0x7f0b059b

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    instance-of v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    check-cast p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSuggestNubiaPushConfig()Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->isAvailable()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-boolean v0, p0, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->inSuggestWidget:Z

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_2
    :goto_0
    return-object v1
.end method

.method private static s()Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "com.zte.mifavor.suggest.SuggestOutActivity"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "android.intent.category.DEFAULT"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static t(Landroid/view/View;)Ljava/util/stream/Stream;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Ljava/util/stream/Stream<",
            "Lcom/android/launcher3/popup/P$i;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 5
    .line 6
    .line 7
    move-result v3

    .line 8
    if-nez v3, :cond_0

    .line 9
    .line 10
    new-array p0, v2, [Lcom/android/launcher3/popup/P$i;

    .line 11
    .line 12
    invoke-static {p0}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    instance-of v3, p0, Lcom/android/launcher3/widget/suggest/a;

    .line 18
    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    sget-object p0, Lcom/android/launcher3/widget/suggest/v;->h:Lcom/android/launcher3/popup/P$i;

    .line 22
    .line 23
    invoke-static {p0}, Ljava/util/stream/Stream;->of(Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 29
    .line 30
    const v3, 0x7f0b059b

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    instance-of v3, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 38
    .line 39
    if-eqz v3, :cond_4

    .line 40
    .line 41
    check-cast p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isDefaultIcon()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isLocked()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    sget-object p0, Lcom/android/launcher3/widget/suggest/v;->g:Lcom/android/launcher3/popup/P$i;

    .line 56
    .line 57
    invoke-static {p0}, Ljava/util/stream/Stream;->of(Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0

    .line 62
    :cond_2
    sget-object p0, Lcom/android/launcher3/widget/suggest/v;->f:Lcom/android/launcher3/popup/P$i;

    .line 63
    .line 64
    invoke-static {p0}, Ljava/util/stream/Stream;->of(Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isLocked()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_4

    .line 74
    .line 75
    new-array p0, v1, [Lcom/android/launcher3/popup/P$i;

    .line 76
    .line 77
    sget-object v1, Lcom/android/launcher3/widget/suggest/v;->g:Lcom/android/launcher3/popup/P$i;

    .line 78
    .line 79
    aput-object v1, p0, v2

    .line 80
    .line 81
    sget-object v1, Lcom/android/launcher3/widget/suggest/v;->h:Lcom/android/launcher3/popup/P$i;

    .line 82
    .line 83
    aput-object v1, p0, v0

    .line 84
    .line 85
    invoke-static {p0}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    :cond_4
    new-array p0, v1, [Lcom/android/launcher3/popup/P$i;

    .line 91
    .line 92
    sget-object v1, Lcom/android/launcher3/widget/suggest/v;->f:Lcom/android/launcher3/popup/P$i;

    .line 93
    .line 94
    aput-object v1, p0, v2

    .line 95
    .line 96
    sget-object v1, Lcom/android/launcher3/widget/suggest/v;->h:Lcom/android/launcher3/popup/P$i;

    .line 97
    .line 98
    aput-object v1, p0, v0

    .line 99
    .line 100
    invoke-static {p0}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0
.end method

.method protected static u(Lcom/android/launcher3/C2;)I
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v1, Lcom/android/launcher3/widget/suggest/o;

    .line 19
    .line 20
    invoke-direct {v1, v0}, Lcom/android/launcher3/widget/suggest/o;-><init>(Ljava/util/ArrayList;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public static v(Lcom/android/launcher3/C2;IILandroid/content/Intent;)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/16 p0, 0x578

    .line 10
    .line 11
    if-eq p1, p0, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    if-nez p3, :cond_2

    .line 15
    .line 16
    return v0

    .line 17
    :cond_2
    const/4 p0, -0x1

    .line 18
    if-eq p2, p0, :cond_3

    .line 19
    .line 20
    return v0

    .line 21
    :cond_3
    const-string p0, "event_type"

    .line 22
    .line 23
    invoke-virtual {p3, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "result"

    .line 28
    .line 29
    invoke-virtual {p3, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v2, "handleSuggestOutActivityResultIfNeed eventType="

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v2, " result="

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v2, "SuggestWidgetUtils"

    .line 59
    .line 60
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    const-string v1, "event_type_delete_last_suggest_widget"

    .line 64
    .line 65
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_4

    .line 70
    .line 71
    sget-object p0, Lcom/android/launcher3/widget/suggest/v;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 72
    .line 73
    if-eqz p0, :cond_4

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/suggest/m;->N0(Z)V

    .line 76
    .line 77
    .line 78
    const/4 p0, 0x0

    .line 79
    sput-object p0, Lcom/android/launcher3/widget/suggest/v;->j:Lcom/android/launcher3/widget/suggest/m;

    .line 80
    .line 81
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v0, "handleSuggestOutActivityResultIfNeed requestCode="

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string p1, " resultCode="

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string p1, " intent="

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    const/4 p0, 0x1

    .line 118
    return p0
.end method

.method public static w(Lcom/android/launcher3/BubbleTextView;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    instance-of p0, p0, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public static x(Lcom/android/launcher3/BubbleTextView;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->w(Lcom/android/launcher3/BubbleTextView;)Z

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
    invoke-static {p0}, Lcom/android/launcher3/nubia/c;->f(Lcom/android/launcher3/BubbleTextView;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static y(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    instance-of p0, p0, Lcom/android/launcher3/widget/suggest/e;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static z(Landroid/appwidget/AppWidgetProviderInfo;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string v0, "com.zte.mifavor.suggest"

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method
