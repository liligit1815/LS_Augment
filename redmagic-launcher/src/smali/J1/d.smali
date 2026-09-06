.class public final synthetic LJ1/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LJ1/m;

.field public final synthetic h:Landroid/content/SharedPreferences;

.field public final synthetic i:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(LJ1/m;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ1/d;->g:LJ1/m;

    .line 5
    .line 6
    iput-object p2, p0, LJ1/d;->h:Landroid/content/SharedPreferences;

    .line 7
    .line 8
    iput-object p3, p0, LJ1/d;->i:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, LJ1/d;->g:LJ1/m;

    .line 2
    .line 3
    iget-object v1, p0, LJ1/d;->h:Landroid/content/SharedPreferences;

    .line 4
    .line 5
    iget-object p0, p0, LJ1/d;->i:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LJ1/m;->d(LJ1/m;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
