.class public final synthetic Lcom/android/launcher3/I3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/J3;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/J3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/I3;->g:Lcom/android/launcher3/J3;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/I3;->g:Lcom/android/launcher3/J3;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/J3;->a(Lcom/android/launcher3/J3;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
