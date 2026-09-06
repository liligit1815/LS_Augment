.class public final synthetic LD1/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:J

.field public final synthetic h:Landroid/content/pm/LauncherApps$PinItemRequest;


# direct methods
.method public synthetic constructor <init>(JLandroid/content/pm/LauncherApps$PinItemRequest;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, LD1/g;->g:J

    .line 5
    .line 6
    iput-object p3, p0, LD1/g;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-wide v0, p0, LD1/g;->g:J

    .line 2
    .line 3
    iget-object p0, p0, LD1/g;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 4
    .line 5
    invoke-static {v0, v1, p0}, LD1/h;->a(JLandroid/content/pm/LauncherApps$PinItemRequest;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
