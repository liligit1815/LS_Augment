.class public final synthetic Ld2/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Landroidx/preference/Preference;

.field public final synthetic h:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Landroidx/preference/Preference;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld2/e;->g:Landroidx/preference/Preference;

    .line 5
    .line 6
    iput-object p2, p0, Ld2/e;->h:Landroid/net/Uri;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ld2/e;->g:Landroidx/preference/Preference;

    .line 2
    .line 3
    iget-object p0, p0, Ld2/e;->h:Landroid/net/Uri;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->x1(Landroidx/preference/Preference;Landroid/net/Uri;Ljava/lang/String;)Lh4/t;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
