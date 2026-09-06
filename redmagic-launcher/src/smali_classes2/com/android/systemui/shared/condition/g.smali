.class public final synthetic Lcom/android/systemui/shared/condition/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/systemui/shared/condition/Monitor;

.field public final synthetic h:Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;

.field public final synthetic i:Lcom/android/systemui/shared/condition/Monitor$SubscriptionState;

.field public final synthetic j:Lcom/android/systemui/shared/condition/Monitor$Subscription;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/condition/Monitor;Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;Lcom/android/systemui/shared/condition/Monitor$SubscriptionState;Lcom/android/systemui/shared/condition/Monitor$Subscription;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/condition/g;->g:Lcom/android/systemui/shared/condition/Monitor;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/systemui/shared/condition/g;->h:Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/systemui/shared/condition/g;->i:Lcom/android/systemui/shared/condition/Monitor$SubscriptionState;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/systemui/shared/condition/g;->j:Lcom/android/systemui/shared/condition/Monitor$Subscription;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/g;->g:Lcom/android/systemui/shared/condition/Monitor;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/systemui/shared/condition/g;->h:Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/systemui/shared/condition/g;->i:Lcom/android/systemui/shared/condition/Monitor$SubscriptionState;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/systemui/shared/condition/g;->j:Lcom/android/systemui/shared/condition/Monitor$Subscription;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/systemui/shared/condition/Monitor;->c(Lcom/android/systemui/shared/condition/Monitor;Lcom/android/systemui/shared/condition/Monitor$Subscription$Token;Lcom/android/systemui/shared/condition/Monitor$SubscriptionState;Lcom/android/systemui/shared/condition/Monitor$Subscription;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
