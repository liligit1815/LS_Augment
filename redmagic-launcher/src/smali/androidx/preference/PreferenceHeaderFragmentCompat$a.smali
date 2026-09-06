.class final Landroidx/preference/PreferenceHeaderFragmentCompat$a;
.super Landroidx/activity/o;
.source "PreferenceHeaderFragmentCompat.kt"

# interfaces
.implements Lj0/b$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/preference/PreferenceHeaderFragmentCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# instance fields
.field private final d:Landroidx/preference/PreferenceHeaderFragmentCompat;


# direct methods
.method public constructor <init>(Landroidx/preference/PreferenceHeaderFragmentCompat;)V
    .locals 1

    .line 1
    const-string v0, "caller"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-direct {p0, v0}, Landroidx/activity/o;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Landroidx/preference/PreferenceHeaderFragmentCompat$a;->d:Landroidx/preference/PreferenceHeaderFragmentCompat;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroidx/preference/PreferenceHeaderFragmentCompat;->p()Lj0/b;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1, p0}, Lj0/b;->a(Lj0/b$f;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "panel"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Landroidx/activity/o;->m(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "panel"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Landroidx/activity/o;->m(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c(Landroid/view/View;F)V
    .locals 0

    .line 1
    const-string p0, "panel"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/preference/PreferenceHeaderFragmentCompat$a;->d:Landroidx/preference/PreferenceHeaderFragmentCompat;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/preference/PreferenceHeaderFragmentCompat;->p()Lj0/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lj0/b;->b()Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
