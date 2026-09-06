.class public final synthetic Ld2/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroidx/preference/Preference$d;


# instance fields
.field public final synthetic g:Ljava/util/List;

.field public final synthetic h:Le2/b;

.field public final synthetic i:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Le2/b;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld2/n;->g:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ld2/n;->h:Le2/b;

    .line 7
    .line 8
    iput-object p3, p0, Ld2/n;->i:Landroid/net/Uri;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final d(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ld2/n;->g:Ljava/util/List;

    .line 2
    .line 3
    iget-object v1, p0, Ld2/n;->h:Le2/b;

    .line 4
    .line 5
    iget-object p0, p0, Ld2/n;->i:Landroid/net/Uri;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->n1(Ljava/util/List;Le2/b;Landroid/net/Uri;Landroidx/preference/Preference;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
